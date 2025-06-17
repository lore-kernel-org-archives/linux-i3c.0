Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F6C7115B
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rtibzirvePETvJrT8evsnBYmLZzh8qlHOzEPSkRS6I=; b=29KE5JL5bqSYHt
	qzqLAgNsRCTgJB4knVTN2pMdxBMylQgRJYLrNrc65/WDCQXcMa9d/cUkRwsk8s5ZpITvwDtgjYyJ1
	aABC1KQSLN5O4eaYSs2GCYp4pzBKQ31X+Sudtf9twyXo/Ea3XrVRaC3viAfKdTV4WcHVjhmee+ARX
	HuGdQu3sBsJMGi2bggG8NeopuT9ZjGdI53UnriTRXt/4z5W4CVizUUWU0UP9L0rJ9hQwNUrf2tr6q
	qCEEkpT2j9Rk0E2aYtR2tl+yFPoW4wZZ7q6ACJ/W+sW8Pgi/yaOau6sco4pJlfMnjKo5l/yAjI3wC
	WmwLCh43yUEGdgkEsw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZq5-00000007yPi-0rJN;
	Tue, 17 Jun 2025 17:11:13 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXwb-00000007hpt-35dQ
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 15:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGR5k8/FqFp73No0k6sWldBxZpfUJvU8RQ76aBn4KWmYbipbgWmazN94YX7KitrbM3fKbfPbIr2mKBW/cgn8p8OpawTbfize2aigYdl1DIaCu7A7r6AYqme5ko9EdfsiowRwTZWQuGuHgyqX67et56LfyB5cTYA1Yb0MNF/3BDho2ekwrt+1n7wf5+4kew7Mun4BNf62QlvuDMY1bFP55ZLn454lXrleWvSaDU+MRXbBCgBRTJQqNJsPpUtxDDD4vbo7MAO7cVaIQiT7GS5uKGRZwumC00OkkC9+J0n3ohKufnOfWTUgT0qTA+Iwm+6DhiNRNHkOHGApyc4D5BvAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBZzmizSF0/Ffiggq0bxySuapJWZlPMVAfVOH2ebqCc=;
 b=J34GmGUKInDtxNFUaMM7o0B0US6YL3uRfrvzfgZKZQliWobdW18yV7e+b/iNc6K/TrpvJtjaro8I9ykJdFYvgbeVx5UQvgiAoQwnb0h+5j9Lj2kgzE7prBJh7PZgOJJBvOc+2IvXI8fHaf8bxKWcYqCbcVAHK0OHWuxtfu5MEc22FZkrisKLgpcxX+9EIaXFUmcc95kN5WN5HNHzpMmBF0iGgyPikfoNOWMNEcaaDC+AFefzp6ZXHLpUqy4ZGhBMu7ZMa/KzA3Oz7EFggZ43fIKZfwvPci9jSbQHP3MrCz/VxKUheu8D+UumiSLqV+tcKETqSosep3xOVo9PD90SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBZzmizSF0/Ffiggq0bxySuapJWZlPMVAfVOH2ebqCc=;
 b=SgZWfYd36phrHsxLSTfm21AAlE1ze4MzmdQrD+RbrthQgc0USrw3WeFn98Wdbc+TBtmGXx8cp4gh7IMPW1VP9I7Dfxc17t6REYWgcmmh3Vv8FVeAtBbXr4h5JhIddeG8QM86gZWc3F1PuWeYiA86vx2tzzuPSm0DPTjewKK1aA6ScIuDmFNPhdFP5Bq2ECD+j+/L3n4X8AgioBAak8r1WIB5D8+wCSFbAFrxjlXQbqI9kxGu8zAFQ1bj83bUCX+Rl1+1iIUFrD19Sjd7ohb4sAz9LAPeYN6PQTXET1jwFYkJMNl71UfgsDRUO7sOozESRoQoWaIBnY/O4/rjEUneeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10334.eurprd04.prod.outlook.com (2603:10a6:102:417::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 15:09:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:09:45 +0000
Date: Tue, 17 Jun 2025 11:09:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic
 to all DMA transfers
Message-ID: <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
 <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DB8PR09CA0002.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10334:EE_
X-MS-Office365-Filtering-Correlation-Id: d92f8bd5-1723-4df6-f198-08ddadb0fe53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jg6PvNg1IhTn2D5zDfrspIgLjEHZ51U2hOYxlqLWRSCJ86tl1+aycJtVfWc8?=
 =?us-ascii?Q?ZZ5YCdFgLDWXyxv8iG/N0d8b0g+Q7qaiSgm8wUKDBXFsRPRn1czgJCWBeLGH?=
 =?us-ascii?Q?wN9essbL0/OIQoctA4LukyId/szFw0kl1BNm+gVLAzALQeDUWmra9aJvPwTs?=
 =?us-ascii?Q?ES0Rh+4NT81oq0/Lg47b/UvSxei1m8dTdReadkVQk1QK1i4PD8cn5aQa+jAV?=
 =?us-ascii?Q?bAOoleQhxYurUvRHkrQBDiLQ/TCyI/CuE3x1fD27OoiTG+auru3I2F/umQdh?=
 =?us-ascii?Q?J+tVDv589LrSVN0kxUuZ2EpnXvU+byQDkMW9dG+oiZuN1XNapk3bJ4hUyviD?=
 =?us-ascii?Q?bOOKRf60+fPxxCRxTc75JkQ6J3+EqX8Tec6R+oHnPwSyT3iz3dUopD2Xvizt?=
 =?us-ascii?Q?TnC45EI2OAZ6C8z+K1o1zAK2jeLSuN0O4PTgeaGNi3r9I2GSYcxpljYah6l2?=
 =?us-ascii?Q?QuUHqr/NEKZtwAmstWOuZ5mEcvJKEXwWrJ6ITkXnkg+rouxwpCff/EuXfekF?=
 =?us-ascii?Q?WZDA1DvOs4K9RBK+Pq/NVH+5Tu8AqucPTeZ9EDyNlw8OM3zRRD8feoAsKl3P?=
 =?us-ascii?Q?q64htcD7jmNB7hqBqNyrwLO+LCaWwv1RvvEArErgCkjRsBfjFU4wYvDchAa/?=
 =?us-ascii?Q?tEPPuu6NZ4e0Sc8bZnLtaOuSIeoDo2nUjXfjFRdXNJSXGD/5pp+Sw7svQax4?=
 =?us-ascii?Q?9DZmMVLBRkVs3aZdIk/xF9lP8ifuAXDRcqNzjE5jKWsJkem6ELOgfmXbPVpz?=
 =?us-ascii?Q?lwVyNJNRwkDsVX5jMvayh4D5CVzJ2RQdZCiOb/8mOrFrlXdS7dBg4z4nUmWu?=
 =?us-ascii?Q?V0vqmt4uLQL80qqEFS1KEmHgB9Brv5ZNCsgRGCRgfXzDpM/F1bqOv1CzQQYe?=
 =?us-ascii?Q?iVXDLHx0j4V1BHVA9+dJjUd8F52IlGFxRYZlVr6668Af/4SeklLPX3NKocuA?=
 =?us-ascii?Q?WF6s61/bOmewTHti8Rk4sZaJ1/6tIbdS5MXlUTDC3l2IK2LNwVWA9z6KtUFL?=
 =?us-ascii?Q?rJh492rZ1Ks3yzgtz9gpFSR4IIkahlThNFmpcTBfD7nrEA97ftHt6WaAJ6NT?=
 =?us-ascii?Q?SzaM7BYzOZCCDRXqY6GBOtcNMpxOJEWYIMjeMVHz+uGJfPclMV37I1x8P9tH?=
 =?us-ascii?Q?7ivowlMWYjRAp8J2Ns1Tl4OVxiOshJDscKR7bq+9jFc5+Avk1kwkr3HIY6kw?=
 =?us-ascii?Q?RqmsYAAvxXahlpcO9McDks1b43598WegDMe1mZrvfwZGZJRlEhsjf1GZjVj5?=
 =?us-ascii?Q?/O7nfnBfI2OvW6WxflF4RGP4ygAtgeIcYcjRYFvyZYZRCbmeMXpLQueERZRY?=
 =?us-ascii?Q?fZ9S3v+uLzUEXrJAJwRISOrpUgWm8Pt79sfawnENkm/mZosLVVT8edMLK+fi?=
 =?us-ascii?Q?HkQOqM39lDB8YMWeYylNS/kfajUXq5TJ9T83HqR5WiLYKVDn5lt6PS3rlf7x?=
 =?us-ascii?Q?DnLxOWmCVd9tHNElg2OSeBwrrjgj91QHFU9jOgSQtv9d+V0JzaEcGP1UIEBh?=
 =?us-ascii?Q?uIfKNBuJvNHW5fg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LRzNbVgAj2iwqcUVSJms7H3R+xJdflbTV2AW59YtoX5WOS4NbgWoUw8lzyMc?=
 =?us-ascii?Q?FNsdVGW85A+t+NoT6hgVa/kZJ9cEp+OnCzvej4s/e8jNda3a/djJ244quyfX?=
 =?us-ascii?Q?rn2Wg/QA8xprCDkUcZsmJTQ183KYukcegpYUKjQndLHJ0S9j9SVlk67ovVQq?=
 =?us-ascii?Q?399mjUfCDG2OOuhCICYq0qFDM8qkX4wDYWCpL5THEAdbL4i7Y1855dfqoMEa?=
 =?us-ascii?Q?IMu123ViQ1v9WLkm0T4XImgSr94TJ7QORmiukLSZl+fKiPGOi/A9bsKp5F4q?=
 =?us-ascii?Q?w8hRSjUCzmpcfE4PoHFS1y80kpZ8Ph+1jrIOcSWbvzk7K0u5FPqboU79MAIg?=
 =?us-ascii?Q?JApqUciNehlRLv1jzYYz7lKer2yjx+DWykxgzFtaZZNcRo9JuUjzbtRevNb3?=
 =?us-ascii?Q?v8RjwN1xlU/FHBZij/OIs79OS5LaqAVVwM775kF2sBuEU9NTrMIP46wIBmHc?=
 =?us-ascii?Q?v5x1t/oOsFMiMYdR6LuYTu9P6ivFzM0kcPf9DDp56db1rcHyAZkTf6YJ0Xc6?=
 =?us-ascii?Q?nTqI4oDlOGDRh9s1F8WSFo4n9/cDwAfLgUHjWBK3Jlkd1k9AZC3XdRyVz0id?=
 =?us-ascii?Q?ucf2wPfYTsksDG/vfIC2bCQqf9C3oWI890wvNWAvvZaZG4OrABGRe8XKg5dF?=
 =?us-ascii?Q?7oqwqvwNjcslfGNgqCnKbvbvuLg8YqfCm7e+boVrpjky8oIvj6v+Nhf6910A?=
 =?us-ascii?Q?ee2hD9A0Ql6kY2auZBJ57BxYn2FwqvBBjgIsK3ZbN9RvJqoc2dAKvNcEIKeZ?=
 =?us-ascii?Q?EDoRcykIJA6+3Tym+mVtxl+oFW6UVKUEtgD+q3ItrY12qYfbjqcj5PDMWtbg?=
 =?us-ascii?Q?cs9VehQfaVQZZL7nw8U9iP28jsFWTTHgrpdVw5NUSs9Kz9OloXjTvviK4wio?=
 =?us-ascii?Q?h59NpQs9yqveU40LTkMXGU5NrOCMz6uZNUthX6q6YfMNKRJ27+T3O0X7afQS?=
 =?us-ascii?Q?jGMETNi80vnXjXOyYCJen3Ril4yJZgZolQZe+2IurCGhbUeJ4n98cskRFn87?=
 =?us-ascii?Q?1E7d2ksolI8gmmA5D/926XKhWKBDuQhRFjpLwQF4/oHu/ypFzO3EPS4J1R8f?=
 =?us-ascii?Q?a4lbu8CypCyJpqKw/dYU+7/1N60fLp+NEwwrecjPIZBQl8JwcMOdD2F1bh9O?=
 =?us-ascii?Q?Bq8dxS8ftMgSxQpm4tNIHYMKcuuB+VHl+7k8VJJVP+lRW8brgqCfIynY11Jd?=
 =?us-ascii?Q?AwU0qoCqznGVQGpFa4M0nudFUMo3iepltEbIKZAuc2Ur2SDT6G37m/tmvtk7?=
 =?us-ascii?Q?giLIt1lqkadRsXdjTDP48rgXwiI7e9+CnnO13R4UVnpF49AcDf+Tck+IT5OH?=
 =?us-ascii?Q?lKttNc6PF0HQaU6iuelfIbATAJRYO512N5C/XuemKJodugp+ecdbgeHSARUa?=
 =?us-ascii?Q?3txkElddHkBo4vJK0ziIomtUQpy+MMJPK4EuMPTUST7GoUf8No/2cjo/Cf6A?=
 =?us-ascii?Q?FEMcG3PC0K0VPmPDhWxLWeXW+FIYZ4G89b1Nd8lVJYVTQ8v79jTISqQ5oMuy?=
 =?us-ascii?Q?qOpjjh7kSX1y23uom4p/xgktPd9/gZMqaPSi4loAMoJEPillaeQ8kB5/nGYL?=
 =?us-ascii?Q?NTOx30O/HUq9RH09fQa8GvVj47VjllSZU4QrW0Hq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92f8bd5-1723-4df6-f198-08ddadb0fe53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:09:45.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtX1Qkfl5pMdv6V3sftqgs2bA0KShY6xXdYr1R4ybCswauMwJJz+5ENEXbUGR4RhqAGSPl0MTNlFiZFozmgT9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_080949_936117_40D0405E 
X-CRM114-Status: GOOD (  49.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Jun 10, 2025 at 01:08:12PM -0400, Frank Li wrote:
> On Tue, Jun 10, 2025 at 04:42:35PM +0300, Jarkko Nikula wrote:
> > On 6/9/25 6:04 PM, Frank Li wrote:
> > > On Mon, Jun 09, 2025 at 05:15:44PM +0300, Jarkko Nikula wrote:
> > > > On 6/6/25 6:02 PM, Frank Li wrote:
> > > > > On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
> > > > > > Hi
> > > > > >
> > > > > > On 6/5/25 6:13 PM, Frank Li wrote:
> > > > > > > On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
> > > > > > > > Hi
> > > > > > > >
> > > > > > > > On 6/4/25 6:00 PM, Frank Li wrote:
> > > > > > > > > On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
> > > > > > > > > > Move DMA bounce buffer code for I3C private transfers to be generic for
> > > > > > > > > > all DMA transfers, and round up the receive bounce buffer size to a
> > > > > > > > > > multiple of DWORDs.
> > > > > > > > > >
> > > > > > > > > > It was observed that when the device DMA is IOMMU mapped and the receive
> > > > > > > > > > length is not a multiple of DWORDs, the last DWORD is padded with stale
> > > > > > > > > > data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
> > > > > > > > > >
> > > > > > > > > > A similar issue, though less severe, occurs when an I3C target returns
> > > > > > > > > > less data than requested. In this case, the padding does not exceed the
> > > > > > > > > > requested number of bytes, assuming the device DMA is not IOMMU mapped.
> > > > > > > > > >
> > > > > > > > > > Therefore, all I3C private transfer, CCC command payload and I2C
> > > > > > > > > > transfer receive buffers must be properly sized for the DMA being IOMMU
> > > > > > > > > > mapped. Even if those buffers are already DMA safe, their size may not
> > > > > > > > > > be, and I don't have a clear idea how to guarantee this other than
> > > > > > > > > > using a local bounce buffer.
> > > > > > > > > >
> > > > > > > > > > To prepare for the device DMA being IOMMU mapped and to address the
> > > > > > > > > > above issue, implement a local, properly sized bounce buffer for all
> > > > > > > > > > DMA transfers. For now, allocate it only when the buffer is in the
> > > > > > > > > > vmalloc() area to avoid unnecessary copying with CCC commands and
> > > > > > > > > > DMA-safe I2C transfers.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > > > > > > > > ---
> > > > > > > > > >      drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
> > > > > > > > > >      drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
> > > > > > > > > >      2 files changed, 46 insertions(+), 35 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > > index bc4538694540..24c5e7d5b439 100644
> > > > > > > > > > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> > > > > > > > > > @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
> > > > > > > > > >      	return hci->cmd->perform_daa(hci);
> > > > > > > > > >      }
> > > > > > > > > >
> > > > > > > > > ...
> > > > > > > > > >      }
> > > > > > > > > >
> > > > > > > > > > +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
> > > > > > > > > > +					 struct hci_xfer *xfer)
> > > > > > > > > > +{
> > > > > > > > > > +	if (!is_vmalloc_addr(xfer->data))
> > > > > > > > > > +		return xfer->data;
> > > > > > > > > > +
> > > > > > > > > > +	if (xfer->rnw)
> > > > > > > > > > +		/*
> > > > > > > > > > +		 * Round up the receive bounce buffer length to a multiple of
> > > > > > > > > > +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
> > > > > > > > > > +		 * transfers may corrupt the last DWORD when transfer length is
> > > > > > > > > > +		 * not a multiple of DWORDs. This was observed when the device
> > > > > > > > > > +		 * DMA is IOMMU mapped or when an I3C target device returns
> > > > > > > > > > +		 * less data than requested. Latter case is less severe and
> > > > > > > > > > +		 * does not exceed the requested number of bytes, assuming the
> > > > > > > > > > +		 * device DMA is not IOMMU mapped.
> > > > > > > > > > +		 */
> > > > > > > > > > +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
> > > > > > > > > > +					   GFP_KERNEL);
> > > > > > > > > > +	else
> > > > > > > > > > +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
> > > > > > > > > > +					   GFP_KERNEL);
> > > > > > > > > > +
> > > > > > > > > > +	return xfer->bounce_buf;
> > > > > > > > >
> > > > > > > > > Why need use bounce_buf? why not use dma_map_single()?, which will check
> > > > > > > > > alignment and size to decide if use swiotlb as bounce buffer.
> > > > > > > > >
> > > > > > > > We do pass the buffer to the dma_map_single(). I've understood swiotlb is
> > > > > > > > transparently used when the DMA cannot directly access the memory but that's
> > > > > > > > not the case here.
> > > > > > >
> > > > > > > why not? even though you have to use internal buf, why not use
> > > > > > > dma_alloc_coherent().
> > > > > > >
> > > > > > I don't think it's suitable for "smallish" per transfer allocations/mappings
> > > > > > and buffer is not accessed concurrently by the CPU and DMA during the
> > > > > > transfer.
> > > > >
> > > > > I still can't understand why need this special handle for i3c. Basic it use
> > > > > dma transfer to transfer data. Can you simple descript hci's data flow?
> > > > >
> > > > Unfortunately my knowledge doesn't go deeply enough in HW but I could guess
> > > > it's somewhere in MIPI I3C HCI DMA engine implementation and/or HCI IP to
> > > > memory bridge/bus integration.
> > > >
> > > > If it would be a cache line issue then I would think we would see corruption
> > > > independently is the DMA IOMMU mapped or not and in larger number of bytes
> > > > than 1-3 last bytes.
> > > >
> > > > Also another finding that if I3C target returns less data than expected then
> > > > there is also padding in the last DWORD with the real data. But not more
> > > > than requested, i.e. 2 bytes expected, target returns 1, only the 2nd byte
> > > > contains stale data and bytes 3-4 untouched. Or 8 bytes expected, target
> > > > returns 1, bytes 2-4 contain stale data and bytes 5-8 untouched.
> > > >
> > > > So something around trailing bytes handling in the HW when the transfer
> > > > length is not multiple of DWORDs as far as I could guess.
> > >
> > > That's reason why should not manually handle dma buffer here. It is
> > > small memory and less proformance requirement.
> > >
> > > If you use dma provided api, you should not take care such detial. DMA
> > > buffer at least one cache line size. otherwise, dma may currupt some data,
> > > which is hard to find.
> > >
> > Do you know what solution would solve the problem here?
> >
> > Let's take a look at the CCC command which is the easiest here. For example
> > GETPID where payload length is 6 bytes and is allocated using the kzalloc()
> > which guarantees the buffer is cache line aligned and ought to be DMA-safe.
> >
> > i3c_master_getpid_locked()
> > 	i3c_ccc_cmd_dest_init() // Allocates 6-byte payload buffer
> > 	i3c_master_send_ccc_cmd_locked()
> > 		i3c_hci_send_ccc_cmd() // mipi-i3c-hci
> > 			xfer[i].data = ccc->dests[i].payload.data;
> > 			hci_dma_queue_xfer()
> > 				// bounce buffer stuff, this patchset
> > 				dma_map_single()
> > 				// setup hw with DMA address
> > 				// and queue the transfer
> >
> > The DMA streaming API dma_map_single() maps buffer's CPU virtual address to
> > the DMA address and we use that to setup the HW and do the DMA.
> >
> > Assume now the DMA is IOMMU mapped. DMA writes correctly 6 bytes to the
> > payload buffer + 2 extra stale bytes. In this case perhaps harmless (due to
> > kzalloc() allocated buffer) but nevertheless corruption which KFENCE may be
> > able to detect.
> >
> > More difficult territory are I3C private transfers and especially I2C
> > transfers. I3C private transfers are expected to pass a DMA-able buffer but
> > I've noticed it may not be always true especially when I3C support is added
> > into existing I2C or SPI target device drivers and that are using
> > regmap_bulk_read(). Those use cases may pass a stack variable (not DMA-able
> > and will be rejected by DMA API), structure member or buffer index and
> > pointer into those come as it via regmap_bulk_read().
> >
> > I2C message buffers are not even expected to be DMA-able.
> > drivers/i2c/i2c-core-base.c has a helper i2c_get_dma_safe_msg_buf() but I
> > see it has the same problem than with the CCC command payload buffer.
> >
> > So far I haven't figured out any better solution than using a local bounce
> > buffer for all of these transfer types.
>
> Thanks, I finially understand the problem you faced. I think other master
> controller face similar issue if they use dma. Let me think more. If alloc
> buffer size is not align to cache line, swtlib will bounce again.
>
> rough idea i3c core layer provide an i3c_(un)map_api to do that.

struct i3c_dma {
	void *bounce;
	dma_addr_t addr;
	enum dma_data_direction;
	void *data;
	size_t data_size;
	size_t bounce_size;
}

struct i3c_dma *i3c_dma_map_single(struct device *dev, void *data, size_t sz, enum dma_data_direction dir)
{
	struct i3c_dma *p

	p = kmalloc(sizeof(*p));
	if (!p)
		return p;

	if (is_vmalloc_addr(data)) {
		p->bounce = kmalloc(align_up(sz, CACHE_LINE_SIZE)); //avoid swtlib bounce again.
		memcpy()
		...
	}

	dma_map_single();
	...
}

void i3c_dma_unmap_single(struct i3c_dma *p)
{
	dma_unmap_single();

	...
	if (data != bounce)
		memcpy();

	kfree(p);
}

#define DEFINE_FREE(i3c_dma_unmap_single, struct i3c_dma *, if (_T)i3c_dma_unmap_single(_T))


Frank



>
> Frank
>
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
