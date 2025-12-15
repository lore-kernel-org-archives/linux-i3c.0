Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39910D5B84D
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVoDcBZkrOOoi5vDqHXuC6sfQBmFlAy+00w59noCD4k=; b=OdbKf4ea98HF00
	s3Bz1Wd8CT01EIlNSXP0yqiz2bgOo9swjSaTOx9W8KTiVwxLx45HCOcuy+MUx+2eqHkWZeGpr9ny0
	7INDnibYJfelSeOxWMCdrQJBWr7OvXj/At7M5rN1Nk8DpLm9pG0ooFU/EdLJTsQ0fKQemVWcT+Esh
	LZO6kCHnYz2j6NhrJvTaQI3bKo64wlBkaY+3789uADSImWzBGDQ6trxncV++9LoVYincJvmwFFExB
	7j4uU6J3b+va+zEhD5uFSFRjtRJyI3qWqsRKQRgArwii5urWp8m27+j0RJThjmQWRvuw+pun31Jwr
	itoIpLJJ8Kw6DL4REWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBOC-00000003yzs-1Rti;
	Mon, 15 Dec 2025 16:25:36 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBO8-00000003yzU-38nz
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 16:25:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXP3rRRllSSpsPd7nNlfOMdlxuJ9mxYiZNrfpnvmPbcmbkA4vf1n/Rzs9eRB9bMaFyODuUl7jby6Jf6edrWP7CY1LPPiArGM3nxYOseMD/9JcCQgMMJU9/N0DkOxoiJ4OwbmsvMTUvTw8MM4DY+9yqou9fQCEpFQDJv8XcWJpmtf3Sjkk5TDejyaDyys5x32J9Wy6t3bNDbDE7RMnT8EcgiTsNGV/eB2k51JfeRceEAlaSF50GU49yQGud8di579CAFhhqc6ucsvmohYk/w8qt73fjwEakTegDOjjWiHKbhIuvwsPjykOlwLMPVAojKvg+eLVNRfgOntT/WwsZ9Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3YaSHHztlt0Fv6Nf9Xi4x8nXnWqnJtmo/Q5s1ja2Vc=;
 b=CN6Rw+XGnE7yYhXO0UGNpYkfZuuOPXrPzikZM8JdYOpo+d7rTjVaiLg3t8CGo+ASDV7Wctf2fmDeIfbX/OMj4ae66b8LE84f1BNE0kihK7ErNnqDgw45uZLybf41qadzw3XprdrqmCY15lgha/QC6MzSs7ycvqTanY8cqyQ1BXexf0erif2WVf9nHkFDAe9SE7CSLMQ7FWNujto5iSvR+QxVeJkEfJMRw8MGintZ5dtIoVpGUuDu8UbHAfx4JEHnZyeMILVIJuBt9nwaJZZapwsFaIW6RxBfoomFWuPUeFa5CZ7AK6mIna/tV+McGBJZp2cBFo2UcfblZ2wysG2B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3YaSHHztlt0Fv6Nf9Xi4x8nXnWqnJtmo/Q5s1ja2Vc=;
 b=PcsceS6QHUuWqqtN1GPSZD9bFzeAl0fWy/Tug4BC8BTsdg0uBwofgeDvfd+ooEbQyRyKPt/AxloLCLcMl9W+90CAaVHr3y3znjE0u46rKG2aEabM5ZVX89tGbexydoZjVJTdfpovfjPmpqgerKE9Oet65HV9sY6hTQ2v8G6mskfgK3B+4xZLZLazg69dhCLQwzlOv8e9my7WIr+n2EKK0gS/LRlhOhyGXA96LXTSngD9cve2DK9ESLMryTTa3NwSCwiGs8bfpOrKn2HfZ1Vsr0Er6ix8pGaeB35HRMRUmzFyfWYDHSHlUS9dDS7IwNpsHU2XG0T9ieS7he4LqVgOwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:25:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:25:27 +0000
Date: Mon, 15 Dec 2025 11:25:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <aUA2cr9M2iGxN+rQ@lizhi-Precision-Tower-5810>
References: <202512082058408ee92ee8@mail.local>
 <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
 <202512091248543fcf4c83@mail.local>
 <c7e29aeb-c258-45e6-af78-9a81ee8de327@ovhcloud.com>
 <aThbaFalAXblN56U@lizhi-Precision-Tower-5810>
 <55935d9e-a647-4cd0-86a0-915c4aebc302@ovhcloud.com>
 <aTmPs3yviUjr2lXR@lizhi-Precision-Tower-5810>
 <d087f1c8-12be-4456-ac7c-978a82771ab8@ovhcloud.com>
 <aTr21PvJUH3+Cwqp@lizhi-Precision-Tower-5810>
 <365eca18-446c-4cb2-a3e7-1f07136137f3@ovhcloud.com>
Content-Disposition: inline
In-Reply-To: <365eca18-446c-4cb2-a3e7-1f07136137f3@ovhcloud.com>
X-ClientProxiedBy: PH8PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: b15edd25-9454-4ccc-373d-08de3bf68ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b3VMQInfPwmgbp7+drxDkf57iS6wDA2GligXdnzUylYLLoMowwJNSbE8Vx?=
 =?iso-8859-1?Q?Kvrv5AR/z4ZpSvyxVb/q6l5qj1LNIKUqAquG8caN4IU/QbVjdDLUabIA90?=
 =?iso-8859-1?Q?OsyyQWwRj/sFjMl6wypCliCi5LbShFPEdvqI3hSK1GgZnyhK+rGRBEZMlK?=
 =?iso-8859-1?Q?pMraFzSByRYhWdodAwKCNXjEt7UdyhFjHxBjLRGxXyQWM24pFauSO1fufB?=
 =?iso-8859-1?Q?L4mlWB3gzI13+AA4fzUXB0vnO44+BWdbJMHMCUFxNNAaCjIwAziV9LRCHD?=
 =?iso-8859-1?Q?Yb3a+s3NezW9sDGvmYX/KHow8wBNlSlxR60fIOdyz+Kt5XqLUFfMDzFGEe?=
 =?iso-8859-1?Q?P1jh/3xGQyoF34jFnycGtTGcR89WkdyIEyhNh61lYfs50Y+24ntWPhqkZw?=
 =?iso-8859-1?Q?erYq3INnWqXScGXJI6WmgvK0FJF/WfpGN3mEI/T6tinjcdGPmFDruAztX3?=
 =?iso-8859-1?Q?Myj7LzAv7RF0aE0IsyFtU1RjVLGtDlWj8AHazvOW09p5tTEuWZwm5OQRYM?=
 =?iso-8859-1?Q?nT0jAAwIyBSnfmMc07NA5tMOvV5G9b50bPukj/ffQvGCloKwMGgmkvA2wz?=
 =?iso-8859-1?Q?jvW68Qnm3Vn3TplTNcJHTakfgPiQ1/vumd503oazy2HtWf4/jqc328yeaz?=
 =?iso-8859-1?Q?xvKH2UyQEQcZWlVJhkuskJsWemTKHv8LaNxO55r3mlHby8tpdl6iaMNTNQ?=
 =?iso-8859-1?Q?zpH9EfDoSfDkmSjkyV3vkbW2MNbDtWoZegbA5rkrnnEwEqBetYr4KLrSXD?=
 =?iso-8859-1?Q?enTxoxw8zEGJqRVy5FbqWy4bK6UayIkm0YQn7B1fwAVxiuX16cawUKs2eu?=
 =?iso-8859-1?Q?BDPQH2af9FC55twmH/J9x+GDSlshhRdJvIVVUFX7R/QdIsKzL3WeJYoLup?=
 =?iso-8859-1?Q?pcCrhyIEhNflSD9rEtj2/ytOgDS+m68M36D0tJI6tAd03gkLo6HFobm/zF?=
 =?iso-8859-1?Q?v1etz7Zz8nTYN/IAb7drwpXgt/93e+X8xPqL4uAmAucJ389KvPDNkudzvv?=
 =?iso-8859-1?Q?bni1hRhe1vCN0U3tdiGCjd5N5Xv1e0ap8Qisc7TDVO9Rpr980VDCpXh27U?=
 =?iso-8859-1?Q?3y7QV3mmWdPqTW5krWxPFYqXfxxDpBL72Lv9/t4iEw3q1r+GzBd51SKvAP?=
 =?iso-8859-1?Q?vlRL1mZ9xAxNnqj9z0KepW/5fkyCpnkeJEE41x5xdx9uQEdUf3VlOiIHer?=
 =?iso-8859-1?Q?FLVjU1lJHV6XnQjMlkA3fz4CpTV3aH7BgFh7+liPPDdu+o0U5IMs6fAJv5?=
 =?iso-8859-1?Q?+Qoo6Aun4P86vTQB6KkTtpvySILNyEtjK1WuxmzTjg0dC/7GDUabh3/79p?=
 =?iso-8859-1?Q?feQl4sJv3VbPdK2GisID+ESzD/f3mwrNhz46DUIlxcqvRXbG+VJP4rXt9/?=
 =?iso-8859-1?Q?z7W6MC0yKHGqDHmk3ip4ZN5Jefn2wA9862NRx/NBol7oRf1SyfmEq75c/P?=
 =?iso-8859-1?Q?DQTGwmkY0YTGNNemPSiPxOku7lR4ii4YCLI+mj3hGOKXGD42i8y2NOQwtT?=
 =?iso-8859-1?Q?S6S+rompfIBdN+9C7pjj1F9DBV+wZCtJwPyarREF7/Qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RwsrYlDIp9Tf8WlxHDDk1yacHPpEOHOaaR3nnhJxFdkmfeaIJ7Fq/3j0Q1?=
 =?iso-8859-1?Q?3nUmo4CsXJt4X5Fd+xLYRayixhIlI+TDfB+DAL5c+rWyRqrAQdZeyybbJ7?=
 =?iso-8859-1?Q?mhiVEU7lRVPCQ/1uv5gufEQKTyb6L+tQSxBdf908Nl4/5fbA6s14GagTmS?=
 =?iso-8859-1?Q?NIhawPWgg39TGJ76qaAu/H1SeufMC06WiWimXnE/wNtRnCMX0U6v83XzjE?=
 =?iso-8859-1?Q?WMZxiM3tVdf/usGIhVreXzWob+kCEXvPXJakTGzXKgrmzzthBACcEOQdDG?=
 =?iso-8859-1?Q?TFwnwCbUWxfd7XbL6FcAEVMlMv4TghwVxZ/4oNROR5wVolQPo4n9C5oGbj?=
 =?iso-8859-1?Q?VTXKrtthT3hPkm3kvz6ZbGmji1wX/30sqBIvIJbOCRVIsviy0Olg5GpDoV?=
 =?iso-8859-1?Q?LSzYpoCb3QaChnS+O42kps9ixQ3FGIR/fsbeNYq+nEIlCkf6osj3onduDZ?=
 =?iso-8859-1?Q?DBAPfel704CoxW5HZZV5pxxwn4UVjWYWutRxeIqfltInnFHDOk3GHM6U15?=
 =?iso-8859-1?Q?4Rd4jQBjJRBPhWxLRsjY24mI7/Tzlmj/0xHlXHmYnbDZ8yul2QH58PW757?=
 =?iso-8859-1?Q?kSZmPIDwXx5KGHT29z731nww81var3SfCT+jkTS3dxiuAemMYwKuQqZBkB?=
 =?iso-8859-1?Q?RTXb/8WZfUFdF4dnlKPAvWKEl5JYRy9BTK7+k2mDiPcoSswgIzIi2/Rf+X?=
 =?iso-8859-1?Q?shDBTPj9TqCqYkcuUy+43XKO/Pn8IhLo9huUPt1iR2x9VwR4t02wIeUNSA?=
 =?iso-8859-1?Q?lF8A7riaUEfJK7cMt05jQ/CYVcYtmpj3YysTDkOr4HQLHXwNSn0jRNtHhP?=
 =?iso-8859-1?Q?HiFVjU+umZ9w+G0vwBY5RDZbqgS5lXWEv7GCFWA2p2qMcNcwxsZDVPaTji?=
 =?iso-8859-1?Q?R/BkHPsofR/W1VrAZOdDkaW5cdLMzQsrdgqflsdPdHyVaVsKaWmPTXsp+S?=
 =?iso-8859-1?Q?83rtspjmCR8tNRv24RSEgtuQktzcQlx7/tR2KkqiuWoRNHc1mq98V8hzEb?=
 =?iso-8859-1?Q?+OVzAVJVQSFp5A/g3jgD0F7R3XlSAIK8g0krbNCnCSiMpxIsWcmAvtTR/5?=
 =?iso-8859-1?Q?Tgwa79xhrLRXHhxi7FIcrBxRzC6UESj7s6lTl6hnSYW7ye/I0b5y/ySjcR?=
 =?iso-8859-1?Q?WCgxmMXFkSttnA9lmAfbQ9h75m0D0MeRvErcGq/yc/ppptzU1z5IcUQSlt?=
 =?iso-8859-1?Q?dCnIe1zuUnsEVVy/xFe04nD8df+IRSOSdfihaKp9X7hfXGOSL/YajOiH7L?=
 =?iso-8859-1?Q?T6M1eKaQk8tFOBVt5IjznWjW8S3EShJL9e24pzQ24NqwzV5HElrq4+Kw2x?=
 =?iso-8859-1?Q?4Hqilf+C8XjeR19H1ZNAg9p8pnWMQu4RSnUsOBlwRh9sNFyzU+3TL5GkQR?=
 =?iso-8859-1?Q?zEkq36/VmbV3WUTUs8+4bWj14yLIJ9I7CBd3k2+PLcZZrlV1OMvD0Xry2b?=
 =?iso-8859-1?Q?LUxEvu+m9pas8SalAiho6wqpIHjMSavZEB+ZWhw9raju/hi6n3pGBLhQlp?=
 =?iso-8859-1?Q?5Xa+rqT/1tZmdxe3TMpb6M3dyg9wDG8izglgzXhFNyvaWdiA9nXNq3ueOs?=
 =?iso-8859-1?Q?yiC/Q03Zvqv1WQsG69XP9nMD1FUXQo7WYzRQx3MA7fB4xyiqhpIL1itgFq?=
 =?iso-8859-1?Q?C8zwhJo+hLecI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15edd25-9454-4ccc-373d-08de3bf68ed7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:25:27.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGBuYpe9Ao9sWDUJ5HGiC7UmGj09W4AZh5Q/+B/8FKpGtn9fs7bdR2k/owO9FtUEz0QjVGnoJPz/DC2lSTtJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_082533_054683_A724F08F 
X-CRM114-Status: GOOD (  40.04  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Dec 12, 2025 at 08:44:41PM +0100, Louis Sautier wrote:
> On 12/11/25 17:52, Frank Li wrote:
> > On Wed, Dec 10, 2025 at 08:50:24PM +0100, Louis Sautier wrote:
> > > On 12/10/25 16:20, Frank Li wrote:
> > > > On Tue, Dec 09, 2025 at 08:52:46PM +0100, Louis Sautier wrote:
> > > > > On 12/9/25 18:24, Frank Li wrote:
> > > > > > On Tue, Dec 09, 2025 at 04:36:30PM +0100, Louis Sautier wrote:
> > > > > > > On 12/9/25 13:48, Alexandre Belloni wrote:
> > > > > > > > On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> > > > > > > > > On 12/8/25 21:58, Alexandre Belloni wrote:
> > > > > > > > > > Hello Louis,
> > > > > > > > > >
> > > > > > > > > > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > > > > > > > > > Hello,
> > > > > > > > > > >
> > > > > > > > > > > I'm running into a bug when loading the dw-i3c-master=
 module on kernel 6.18
> > > > > > > > > > > on one specific server. I suspect it has to do with t=
he large number of
> > > > > > > > > > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC=
 9965 processors) but I am
> > > > > > > > > > > not sure.
> > > > > > > > > > >
> > > > > > > > > > > The system is on Ubuntu 25.10 and a 6.18 kernel with =
https://gist.githubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/r=
aw/115da594dc9d7ea99b06754847571e6fd76d9da5/config
> > > > > > > > > > > (basically Ubuntu's).
> > > > > > > > > > Just to be sure, does this also happen with v6.17?
> > > > > > > > > >
> > > > > > > > > > The only change is the shutdown handling so I would gue=
ss yes.
> > > > > > > > > >
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > It does happen with 6.17. I initially discovered this whi=
le running Ubuntu
> > > > > > > > > 25.10's stock kernel (6.17.0).
> > > > > > > > >
> > > > > > > > > > What is the behavior when you build the dw-i3c-master a=
s a static driver?
> > > > > > > > > I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> > > > > > > > >
> > > > > > > > > Someone also suggested (they didn't reply to the list tho=
ugh) that I add a
> > > > > > > > > printk to see what the value of maxdevs is. I'll provide =
the log as soon as
> > > > > > > > > I have rebuilt with:
> > > > > > > > >
> > > > > > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	20=
25-11-30 22:42:10.000000000 +0000
> > > > > > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-12=
-08 18:17:33.151567225 +0000
> > > > > > > > > @@ -1588,6 +1588,7 @@
> > > > > > > > >      	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POIN=
TER);
> > > > > > > > >      	master->datstartaddr =3D ret;
> > > > > > > > >      	master->maxdevs =3D ret >> 16;
> > > > > > > > > +	printk("maxdevs: %d\n",  master->maxdevs);
> > > > > > > > >      	master->free_pos =3D GENMASK(master->maxdevs - 1, 0=
);
> > > > > > > > >      	master->quirks =3D (unsigned long)device_get_match_=
data(&pdev->dev);
> > > > > > > > >
> > > > > > > > Yes, that was going to be my suggestion.
> > > > > > > >
> > > > > > > I haven't tried with the driver built-in yet. This is what th=
e printk shows:
> > > > > > > dw-i3c-master AMDI0015:00: probe with driver dw-i3c-master fa=
iled with error
> > > > > > > -110
> > > > > > > maxdevs: 65535
> > > > > > Maybe ret is bigger 0x8000_0000, and ret is sign int. so >>16 b=
ecause -1.
> > > > > >
> > > > > > unsigned int val =3D readl(master->regs + DEVICE_ADDR_TABLE_POI=
NTER);
> > > > > >
> > > > > > master->maxdevs =3D val >> 16;
> > > > > >
> > > > > > Frank
> > > > > I tried this and CONFIG_DW_I3C_MASTER=3Dy:
> > > > >
> > > > > --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c 2025-11-30
> > > > > 22:42:10.000000000 +0000
> > > > > +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c=A0 =A0 =A0 =A02=
025-12-09
> > > > > 19:21:52.735366616 +0000
> > > > > @@ -1585,9 +1585,10 @@
> > > > >   =A0 =A0 =A0 =A0 ret =3D readl(master->regs + DATA_BUFFER_STATUS=
_LEVEL);
> > > > >   =A0 =A0 =A0 =A0 master->caps.datafifodepth =3D DATA_BUFFER_STAT=
US_LEVEL_TX(ret);
> > > > >
> > > > > -=A0 =A0 =A0 =A0ret =3D readl(master->regs + DEVICE_ADDR_TABLE_PO=
INTER);
> > > > > -=A0 =A0 =A0 =A0master->datstartaddr =3D ret;
> > > > > -=A0 =A0 =A0 =A0master->maxdevs =3D ret >> 16;
> > > > > +=A0 =A0 =A0 =A0unsigned int val =3D readl(master->regs + DEVICE_=
ADDR_TABLE_POINTER);
> > > > > +=A0 =A0 =A0 =A0master->datstartaddr =3D val;
> > > > > +=A0 =A0 =A0 =A0master->maxdevs =3D val >> 16;
> > > > > +=A0 =A0 =A0 =A0printk("maxdevs (unsigned): %d\n",=A0 master->max=
devs);
> > > > >   =A0 =A0 =A0 =A0 master->free_pos =3D GENMASK(master->maxdevs - =
1, 0);
> > > > >
> > > > >   =A0 =A0 =A0 =A0 master->quirks =3D (unsigned long)device_get_ma=
tch_data(&pdev->dev);
> > > > >
> > > > > And I get this log, so no change, really. I assume there's only o=
ne
> > > > > "maxdevs" log because there is only one attempt to load the built=
-in driver?
> > > > It may have dependence missed at drivers. such as clock. when built=
-in,
> > > > this driver probe first before clock ready.
> > > >
> > > > If build as module, other driver help enable this clock. So it can =
get
> > > > correct value.
> > > >
> > > > Frank
> > > My bad, I checked yesterday's entire log again and actually, there ar=
e still
> > > 4 maxdevs printk logs:
> > >
> > > Built-in driver:
> > >
> > > # journalctl -b -2 --grep "maxdevs|UBSAN" -o short-monotonic
> > > [=A0 =A023.162996] ns31482903 kernel: maxdevs (unsigned): 65535
> > Look this instance miss config some resource, like clks. So clock have
> > not enable, all register return 0xFFFFFFFF.
> >
> > Frank
>
> Can you help me understand why this happens and how to fix this? Could th=
is
> be a hardware problem?
>
> Should I open a downstream Ubuntu bug report, would that be helpful?

It may help, or report bug to hardware vendor. Or look for recently
contributor who may provide help.

git log drivers/i3c/master/dw-i3c-master.c


Frank

>
> >
> > > [=A0 =A023.163008] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > drivers/i3c/master/dw-i3c-master.c:1592:21
> > > [=A0 =A023.166508] ns31482903 kernel: maxdevs (unsigned): 65535
> > > [=A0 =A023.166568] ns31482903 kernel: maxdevs (unsigned): 11
> > > [=A0 =A023.166576] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > drivers/i3c/master/dw-i3c-master.c:885:12
> > > [=A0 =A023.166748] ns31482903 kernel: maxdevs (unsigned): 11
> > >
> > >
> > > I rebuilt with CONFIG_DW_I3C_MASTER=3Dm and I get the same logs altho=
ugh the
> > > timing differs a little:
> > >
> > > # journalctl -b -1 --grep "maxdevs|UBSAN" -o short-monotonic
> > > [=A0 =A014.507929] ns31482903 kernel: maxdevs (unsigned): 65535
> > > [=A0 =A014.507957] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > drivers/i3c/master/dw-i3c-master.c:1592:21
> > > [=A0 =A016.683035] ns31482903 kernel: maxdevs (unsigned): 65535
> > > [=A0 =A018.872323] ns31482903 kernel: maxdevs (unsigned): 11
> > > [=A0 =A018.872362] ns31482903 kernel: UBSAN: shift-out-of-bounds in
> > > drivers/i3c/master/dw-i3c-master.c:885:12
> > > [=A0 =A018.882020] ns31482903 kernel: maxdevs (unsigned): 11
> > >
> > > Did I miss something with the unsigned patch?
> > > > > maxdevs (unsigned): 65535
> > > > > ------------[ cut here ]------------
> > > > > UBSAN: shift-out-of-bounds in drivers/i3c/master/dw-i3c-master.c:=
1592:21
> > > > > usb 1-1: new high-speed USB device number 2 using xhci_hcd
> > > > > shift exponent 18446744073709486145 is too large for 64-bit type =
'long
> > > > > unsigned int'
> > > > > CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0 #4
> > > > > PREEMPT(voluntary)
> > > > > Hardware name: Giga Computing MZ73-LM2-000/MZ73-LM2-000, BIOS R23=
_F43
> > > > > 11/28/2025
> > > > > Call Trace:
> > > > >   =A0<TASK>
> > > > >   =A0dump_stack_lvl+0x5f/0x90
> > > > >   =A0dump_stack+0x10/0x18
> > > > >   =A0ubsan_epilogue+0x9/0x39
> > > > >   =A0__ubsan_handle_shift_out_of_bounds.cold+0xdd/0x1c9
> > > > >   =A0dw_i3c_common_probe.cold+0x16/0x1b
> > > > >   =A0dw_i3c_probe+0x30/0x50
> > > > >   =A0platform_probe+0x42/0xc0
> > > > >   =A0? driver_sysfs_add+0x63/0xd0
> > > > >   =A0really_probe+0xf9/0x370
> > > > >   =A0? pm_runtime_barrier+0x56/0xa0
> > > > >   =A0__driver_probe_device+0x8b/0x160
> > > > >   =A0driver_probe_device+0x24/0xd0
> > > > >   =A0? __pfx___driver_attach+0x10/0x10
> > > > >   =A0__driver_attach+0xef/0x220
> > > > >   =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > > > >   =A0bus_for_each_dev+0x8a/0xe0
> > > > >   =A0driver_attach+0x1e/0x30
> > > > >   =A0bus_add_driver+0x13e/0x230
> > > > >   =A0? __pfx_dw_i3c_driver_init+0x10/0x10
> > > > >   =A0driver_register+0x75/0xf0
> > > > >   =A0__platform_driver_register+0x1e/0x30
> > > > >   =A0dw_i3c_driver_init+0x17/0x30
> > > > >   =A0do_one_initcall+0x59/0x330
> > > > >   =A0kernel_init_freeable+0x2bd/0x340
> > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > >   =A0kernel_init+0x1b/0x160
> > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > >   =A0ret_from_fork+0x202/0x230
> > > > >   =A0? __pfx_kernel_init+0x10/0x10
> > > > >   =A0ret_from_fork_asm+0x1a/0x30
> > > > >   =A0</TASK>
> > > > > ---[ end trace ]---
> > > > >
> > > > >
> > > > > --
> > > > > linux-i3c mailing list
> > > > > linux-i3c@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
