export interface PageOptions {
  pathname: string;
}

export interface Page {
  id: string;
  pathname: string;
  title: string;
  getContent: () => Promise<Content | null>;
  getLayout: () => Promise<Layout | null>;
  getAttributes: () => Promise<{ [attrName: string]: any }>;
}

export type PageData = [
  /** id */
  type: string,
  /** pathname */
  type: string,
  /** title */
  type: string,
  /** getContent */
  type: () => Promise<Content | null>,
  /** getLayout */
  type: () => Promise<Content | null>,
  /** getContentModule */
  type: Promise<any> | undefined,
  /** getLayoutModule */
  type: Promise<any> | undefined
];

export type Content = any;

export type Layout = any;

export interface NavItem {
  title: string;
  href?: string;
  children?: NavItem[];
}

export interface NavOptions {
  category?: string;
}

export interface PluginOptions {
  layouts: {
    [layoutName: string]: string;
    default: string;
  };
  pagesDir: string;
  /**
   * File extensions to parse. Defaults to `['.md', '.mdx']`.
   */
  extensions?: string[];
}

export interface NormalizedPluginOptions extends PluginOptions {
  extensions: string[];
}

export type GetPage = (opts: PageOptions) => Promise<Page | null>;

export type GetNavItems = (opts: NavOptions | undefined) => Promise<NavItem[]>;