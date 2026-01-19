Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CEFD29C45
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Jan 2026 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BO/REAXmSYhezIqMmdzrduxw10Fy0M9Z/MIehLq/rO0=; b=bPq8VqMSECHz8z
	7HrTeJrthJWtPjIiVHPxEPdjqBmOwggbTHBaX0iTMj4CYkkgK3JT5h6X3TdFoPboDH5p2DNqcXB+O
	TJx4i67onhlzNeYQy8Wmr6V5p3ZpPj0bAeembJ8iYvosVC9xKmX47zoFegk4tXayBxdVVjXYtN4a9
	r36s8fcLOWST6tQKUSSffjsJ8CwRpemlPfZkstGOkLip2ohOk0sNsVEx+xCWgs4w0nom6VSyUojIV
	4hoKq8X9qM/pK/9RAylvfzUUklsZhos+387kQ4O5/VKT686zqwSzK/uAMBQ0TVIyh+NXmCT5HHqMd
	4xj5FRK9/THBCIMC4xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsAu-00000002Vdz-2yx6;
	Mon, 19 Jan 2026 16:32:20 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsAo-00000002VZ9-0i0N
	for linux-i3c@lists.infradead.org;
	Mon, 19 Jan 2026 16:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdVA0qOV8mzK8/Z4ABpS3LoebQRpE4TO/99V72zJ4Qf3OaY+zamJqEUpMUNh6LYPic1vQEfUa7+BqFBhq48ZECoU8Yjs6Kxqf7N20cfMZAa9CFUiRoRIBfSO7s1z/fd67uj6AqEslAhhZOaBDkIr7IwCPmFpf+2Az1OdLuABxAqUkxS8z5it/aRFmCJLb3a3D7WKWObRkBrdKmd91EtmeoNeZbK2azNDnBmQIv+dUAlEWdpyq2Q+ITFRkpsgy7e4kLuQ/Kh5V6qG+we20vjzdubPRfRszPlTHIAt+tmM/4LBuDUG16iX5+AEvAvk5M0C6zsfLEBPsVNwcJIKCtv+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHfjEOp6eZl1v55TMNr5pTnhNsTvia9y0bCb/TIMZJs=;
 b=A2RfvVnWZUdDt2aRKk3UW4p28H45lcUdpgQIf8scBh7qeKQeGXlxBm0z7hU7AbGlmQPnZIr7dU78htV1xNKH5rXwARBhrySlkXINYIe534Sf62h0wBvnQZ9PVQufwdSMTQU7wN7zUXQg9lgrbqBSLX1EWfsa/3XLYz52bnEEkGreLehBWZ5ZY8tdq4/Paf+jgISHFwIF4N9+Gn1lajp1HiK3YulYJsb1Fq7R5MaQ60/yd8zhkhnjNSiVccHGTK3+ZZiOIJDGcgEGDPYu91CX26UVKHAMAsphtujfOwRKWRLCswt5A/p1r659wdqgF9G6hYwfSCHdIetc4l7P9Cm24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHfjEOp6eZl1v55TMNr5pTnhNsTvia9y0bCb/TIMZJs=;
 b=bkdzwRCuT+vtgNU+bNuV10HbdaP4fm4KZbDtYgBWgMQiyHNqIEH4X1F2kmy7pNsYndMkNS2V/fsFpDCRYqZoTucVM67y4Nji6FUhSyvOHXJPWEF/YhI0QTHUdS/Eidi6fvrRGnsmSgiEQFCjoqkoXlfSsrnv+1WvA+ZmllVjd42wMjINNeFhSsoRQO/Qg6UGqDCrhndLP5HvTPmTqIqpaqaKRYTPKa0jPak+i2B+7ZWuv4wqZ96ELbnocHqUaZzcHwDmAnKbf3vvhzxtnifxWUGpF6ErpkqbgnRXrMgqPLk/jGcPg7swb43pgS/ie1v0wypzPVqqlVHd+CV5zSRQSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AS8PR04MB8200.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:32:06 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:32:06 +0000
Date: Mon, 19 Jan 2026 11:31:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 1/3] i3c: master: Add i3c_master_do_daa_ext() for
 post-hibernation address recovery
Message-ID: <aW5cfJ2ros8FBEX+@lizhi-Precision-Tower-5810>
References: <20260119100212.29607-1-adrian.hunter@intel.com>
 <20260119100212.29607-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260119100212.29607-2-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AS8PR04MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ce1432-1a4d-4107-4566-08de5778488d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iRyfI8I8UAj/zVCHLRFzQqrq2ZyT6CnK2MptJiCE9rkOHQwLcFW7qyXox4gG?=
 =?us-ascii?Q?BmnyVIanWkHacnTiEPZrDA7czpUQ9hII0hawbqcFlOvYyJot0cr+vi/DAn+M?=
 =?us-ascii?Q?rT6F4PzfPesL4gy+YJWA5fI6eSYuiKOzUGsFQj+h7fl3rMBrEfee7NFhc3ZT?=
 =?us-ascii?Q?uVDEycetGsZGXEb6jRvr9lULJI3T0lc47Bl3ioy8ASyAYrUXxawlCFQwKnvs?=
 =?us-ascii?Q?9zvGMgia7kKqz6u8GNPYNnkx2ie4L3SVOvDZgkdiSWuZgUiYfU0FrdSsmFT3?=
 =?us-ascii?Q?jW0hDEwH41Wcg2qpfs7yl5Opju6bUHUtv/trdZPWi+QokBtO6Egu2Hpp3DzI?=
 =?us-ascii?Q?oW9o8bdh9GaLPcradAnLjafum5OkWLqrHGXdAfjzGX9tmqxK2BdXusSPe7Sd?=
 =?us-ascii?Q?DZr0oJFzBjp/RnnA2wnzxJhVbHk5lPPuOD4OrHXWCB/j4bZfENEgE1c5uU15?=
 =?us-ascii?Q?Hcm5Qmc+I0LY1i7CwEyZuJou5T4027i1r9CYM5/PhqsOCEMS8FYMBtingGCc?=
 =?us-ascii?Q?6JfVECEd7myJuLy37IVAtCWybC29yoNZD/n9+9hvJrjlqSSqTiUaARESwgAX?=
 =?us-ascii?Q?czVll3M1Yx2OeAwtmqqB+9dXSxqPz2fVotQEDlIA+m1YwMdb6b4K7Ez1/CjI?=
 =?us-ascii?Q?KfDZgpk22XXaEEEGDwTCA3oU09b64KRxKY59aNiNQ+Y4O6FCX8OMasNDija+?=
 =?us-ascii?Q?s5cXWKakmMy1om6xNbUscX9Rj6+PMqAbVNpX3CMPtYL03GKd39CI7UF/6Sph?=
 =?us-ascii?Q?BI6ayMtINYDLUdhAXEBxtaehSXzBTVKtlu5oqX4pbwR79j6iuVOuPQ+RqwBr?=
 =?us-ascii?Q?5mkhcREtUwnFRifNln09U7o39snGZ60DK1pVWIgpcVZmUmb0A/BRBAD239e2?=
 =?us-ascii?Q?OtbUA5zAZ8gpyBxqwTHb6TOiWP32j81gTwtZwVuduhW8uActL4HN/3xqDrvH?=
 =?us-ascii?Q?QJCaHToSrw4S5xZev2oL1PM3+8vkFsDVc5ne2HKioxopx/lkguhG08o5oabH?=
 =?us-ascii?Q?RzkBZ+pHt4rfkY6cnoWMOXHWTw7rZe/a872eIo4ChqAOTWDfLVOgCfWFkGHQ?=
 =?us-ascii?Q?HKxgUSzWbLqu746fv9MN3n5WqwjY6dTKPUvkuJhEMZbRXAXEkiZBb/sg2qZV?=
 =?us-ascii?Q?GSlI7B4ZP3Cn6Zw0/9oLffcymQwEkObP9CuVqQsZDwGtOwvx+vUSCWH1AKeG?=
 =?us-ascii?Q?TKEujSccBSgv4khfo+0kh+T6OBvlJqYMhQwLY1s/nhMJTcC/GM21gQBLbOCR?=
 =?us-ascii?Q?J6WDIOskGouWknIAMcueS4fMIW2MM0ZT05/BvL31qnFogkC2OGXgpYCc8Umr?=
 =?us-ascii?Q?kND1WYpXqQwYADdZPru4JXWvowrq6OX/kVYynm1uTFdV9HeV5kwXoSu0ybIv?=
 =?us-ascii?Q?BX1VxvqBuwhOzQn7BwDebQhEdF/7SCv4K7C6S/syhEAZjwN9Uw1xz1zId7ke?=
 =?us-ascii?Q?Q9KONNQwXh1qEigbtdSI0OcjgjguxDgKT9vlIi2CIKU0aSovFljv9J6vdoCx?=
 =?us-ascii?Q?cz1FQ1aZJgfxN8bFgRnvGCgw0KvODM6QEwiw7SQqAzBbj5ELJqDmKK3f1z46?=
 =?us-ascii?Q?7y07RGbstiV1oMWXBMr3PqepwMzN+3CdQKqf0JsPZazZ156XeeG66he3WpdK?=
 =?us-ascii?Q?pi+lJDvWUXuTk1wZaLq8Ea0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rLOz1OSw3MRJo6fV1U1EXv5UewAia8UD1oxSOC/THCfl200hNoFf0P0AvcJh?=
 =?us-ascii?Q?c2JrmT+iVlLi0UC40N5aUxvzVjT0yBbDL4hz3lH6qf+vKI6XlFlU/gMhAlnH?=
 =?us-ascii?Q?uLUgaVJBWT8/71DCy3dSgoTBkUNNWigGzZBxzPnz1r0EJey1ia4+m5GUqeFO?=
 =?us-ascii?Q?iVRr6nPdd+IFSxnzwDvXdVTsqdpSk4UjscKe0SZcKaicxf9b6XwGLfYDhDZp?=
 =?us-ascii?Q?pNvyaEB7OllZ1MWCgdhgdUWpWOQcnyvVXDKh6RAbBtikre6ZNa0qZX8Eh6w9?=
 =?us-ascii?Q?IzCpUYUjPXxp4G8/CzledqB+m/J+Ac9PJELPh9w6NyFkhRXxAeEvXCjzDf9J?=
 =?us-ascii?Q?JZwpgHJ6QzX4/s7Cub3Ia0MBI6JJSIwqeiUAviF8VpIvIk64UQGk0hE3f4C/?=
 =?us-ascii?Q?phLYwAIdT3fqKl7OeyVKrJY39NISz/vLZO93WngJ5XKL0PF/pclM7aakE+Kg?=
 =?us-ascii?Q?6fwLzyPm0yOyGnIASCWw6pqZjg7YMDTCfsR1Phj2y8/SPJ84TKV8IUNffhct?=
 =?us-ascii?Q?k2l2F5p7KunfDGyzskhLSjDP/+hJtD7295eDQ5siHAo4n0H2y9fM3AcPRrhF?=
 =?us-ascii?Q?Qc5xaglWYLLshI/cGRjOVrOQqKWNcFz/nqd1Msvxo3OIX36gtqs0zu8764/y?=
 =?us-ascii?Q?smHM5RX2j80WS95Qop0xZmUL3ZdYEwv8LbUerK+00t92JstRFB17/kItkLCE?=
 =?us-ascii?Q?WwRYQlMg7KcpZxO0ekaWr1viSAkTQMdQjLgeWwJY1fm0KUmmkuvO7mmmBAIU?=
 =?us-ascii?Q?hXT+bO7GIXYSi5k5Z2VRDWkMWc2jiqFbTWodJk3Cyuc0+fCRv4iOFqmm0Vm6?=
 =?us-ascii?Q?j5n+ftzhd5WSCDEKSTUbrEBs/ScE6/y2TLyVgW7S+imwCGEyBZv/xH4tE7ik?=
 =?us-ascii?Q?VtJzctWav5xeBrELRT6SW2gXj/fuMUtSA3VFDgJfqroaNX0ZCEQcTufj0LPZ?=
 =?us-ascii?Q?pCa2hyBtjKlgVeeISztQwS1EHV4cFYi9fchQYK66SwIFpkEVektVgC9kJc9U?=
 =?us-ascii?Q?Bx7cSFsg+3A2A4SlgAi6RQLUGt1s0Gbo0SeR2qdicx2Nc3BdIany5lNnlona?=
 =?us-ascii?Q?dk5C1NmVYz8ee/ECHtILtyfC93uFI/yVpB7EM/DiJnmR7IYj0/EEsfuhPl8C?=
 =?us-ascii?Q?zEdDANhnpsP24j11KyxfayvVw/Aj6a/lQUjAGqFOKHoWkFN208rEHY9rWbv+?=
 =?us-ascii?Q?Z6tWKww1C8RZQYuRDOAl/tkwIVt+DCoLr0tWSTtY0Go1RDGU73Lh48mtC73/?=
 =?us-ascii?Q?bWK0HZ2o2VUUg0EVu8dGUiomsJQvkiyCj4x1iZmk3/2pYR8c5mAv9NPJmF6y?=
 =?us-ascii?Q?ICesXfp9BiCx/be39psnIopCsId3l0NpLCDm3DheRqsQqodU3iJCHF3BWefb?=
 =?us-ascii?Q?ZQT9GnA3ugmUIZ2cDsa9rR9KpctELPjBC0uSh+fkEsj7NaCWw6JXjMKWqWI8?=
 =?us-ascii?Q?UxeR0BFTrU8I/rR28KSa9qvs/Kv2fQrloZ/W/7WaUtlGuCyaDrUZaiTqEimV?=
 =?us-ascii?Q?TL5XzbO7fvDKcaw8TQ5M0NVk5l258AE4IUsxMMOOYiyd+WaT9WrU+N35nYy2?=
 =?us-ascii?Q?7ln8UBNWE8SN8szlf+hWx7BH0XIk+Aa4LUETGyORigmnFztYrF8eoz4Pgqrb?=
 =?us-ascii?Q?AknwJNG18770Av1Yrys7f0cgznmlieR5Pt9sBYpitLDv8E4IPgDO8a7W9NvU?=
 =?us-ascii?Q?E2ad1jPFhemzvBfV6lo2Di12/n0SBw/9rFdrCY0lFJVOfb2E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ce1432-1a4d-4107-4566-08de5778488d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:32:06.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +spPfV8Bikmbfq16RtpGI26Z1MCDXgoMaKa9QZaiw+tleWR+S75esC3RgrmeTQ+FyX0h+IDIrgdqLZ4znj1duw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083214_992992_F1F7A748 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, Jan 19, 2026 at 12:02:10PM +0200, Adrian Hunter wrote:
> After system hibernation, I3C Dynamic Addresses may be reassigned at boot
> and no longer match the values recorded before suspend. Introduce
> i3c_master_do_daa_ext() to handle this situation.
>
> The restore procedure is straightforward: issue a Reset Dynamic Address
> Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
> logic already supports detecting and updating devices whose dynamic
> addresses differ from previously known values.
>
> Refactor the DAA path by introducing a shared helper used by both the
> normal i3c_master_do_daa() path and the new extended restore function,
> and correct the kernel-doc in the process.
>
> Export i3c_master_do_daa_ext() so that master drivers can invoke it from
> their PM restore callbacks.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
...
> -int i3c_master_do_daa(struct i3c_master_controller *master)
> +int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool restore)

is 'rstdaa' better than 'restore'? 'rstdaa' indicate what this API did
actually.

Frank
>  {
> +	int rstret = 0;
>  	int ret;
>
>  	ret = i3c_master_rpm_get(master);
> @@ -1758,7 +1760,15 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  		return ret;
>
>  	i3c_bus_maintenance_lock(&master->bus);
> +
> +	if (restore) {
> +		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +		if (rstret == I3C_ERROR_M2)
> +			rstret = 0;
> +	}
> +
>  	ret = master->ops->do_daa(master);
> +
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> @@ -1769,7 +1779,24 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  	i3c_bus_normaluse_unlock(&master->bus);
>  out:
>  	i3c_master_rpm_put(master);
> -	return ret;
> +
> +	return rstret ?: ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
> +
> +/**
> + * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> + * @master: master doing the DAA
> + *
> + * This function instantiates I3C device objects and adds them to the
> + * I3C device list. All device information is automatically retrieved using
> + * standard CCC commands.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_do_daa(struct i3c_master_controller *master)
> +{
> +	return i3c_master_do_daa_ext(master, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c1ec597f655c..5d0d5359a03e 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool restore);
>  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
>  					  size_t len, bool force_bounce,
>  					  enum dma_data_direction dir);
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
