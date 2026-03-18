Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC097103E183
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eg5E0BUpmAmusRMsEWZsdfTXUaHvKxwawHFqKvyxo7c=; b=u9KlYZo5jtrYBW
	9b3LaxdtPbe/jpPJJZAlMGeIn0qQUiZ/cFaKmmcG4dzN3qV4+Fet5urddME4P2szf9rWLDji3UyLf
	Ez/O230+6vLt8JSdYF3EiBOXYLz+ZJpcta3iVWiP9LZ8hGD37TKoLoenDXD8lPaaW68O1Dr0xOoN6
	EJCvWlbBcfd0Lvmn2v/z4PcjAkWC6H2ewFZcd/eOAoiZN3h1qKM8ETHXE5NdDNgHPMn+HGtxfr5nH
	EY/bowKz9YPsYrwLVd+/UNpGicGsepSHx5d9TLj9wLsBt1+JiG7GHfqBGIb1tQN78ykNos0I91nhm
	OGa6hos0/jHMlUUeZ9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2riC-00000008Zst-26i4;
	Wed, 18 Mar 2026 14:17:28 +0000
Received: from mail-northeuropeazon11010007.outbound.protection.outlook.com ([52.101.84.7] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2riA-00000008Zrz-1FFf
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 14:17:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJbu9lhJgCxbhWdQ8BpIG+CV03i1jd9k+luO/c+KoI+AWW+Pg5UqLwtmL+AvslMVF4iWpsf55ZLPEsZ8vrQe1CEfoCle6SuCs68vlrafgu2fiwQPeXlSCSTP2oYzgdc/67DoWE7EHIZfK6EdvnbRtc3WIjfXz9rKh3DiEvokzu5xdnaWEL+VYRF7fXDke5LBmUNIWsb21xLuBiumNdg0pkX9Hk1meSnqhs24pu1Nsm5p05yL79Wq3B401hehzgFtGpc5EUyat30vJpm8V8+VrZIlQuDay5siiZFbD+uMu7S5xG/xgpXJgm7SxjL9XjdDfsr5AxAOBYzShe14ZdHl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rRrSplyu9XkzxVVIBltszXLqpC8p6S5zFrR59HMoec=;
 b=CdSuPPH0fEmesbxBcHIX7tbzLBvZ/XOQ87rANAM8hP5RATn7v1a9e2tCkhNpC+df0nBuTHXlso96dGw+8BGlKs+BIxdZ4ZPzyla3ynG9TdrASlmT9a25REmLAo4040K/2d9KTlOe1pVADNXVYUBr2JcP5uVklVVKhtjJjjZNxQLIG3o4czuyfklKHO5nur1bd2gEDmx+HY/tCMq9hXsgaraZkNCEbiQaL7rJzKiyCxpnXLlggpkLdnXJ5FvCT4Tpowt+F/BZLr0vQE84fXL9z+47IXyS2hu9ppe/0/OmgIqNGC7bTrfvYxAiHoS66hrWO06qXrNHf8vVHReXviKNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rRrSplyu9XkzxVVIBltszXLqpC8p6S5zFrR59HMoec=;
 b=ev3F4iWERvOeN2BXUGoBMYeFTtSGmEGfrh/QzB0bL903PeGVrRTJj9RNQv8GAWBJPjWIWy6ox9zuydMKMMfLuVN0aNLUo91oHjw/qIWAKRYyjl1MziwQX8UM4GOX6sZr9Gjjny+SJCY7ke1XwW2P41Hkvif7SxwPKtof9p+HAa8xIPa2t9PAR8sqL6NqKJAMDE3/Pl5KMnBJzIbulUYdxyRgJ7NOriagrdyBWa8Nm3Lr3h0nog0F449xL9yA7QRxC/Koe3t4DmnZY4HWFElbxn1y8F24hiBuG6y0N2UnYnBG0Hjw9jvBy6QxI+flEebRzWSTpQm7SPQ/IFPMyc1Tnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10178.eurprd04.prod.outlook.com (2603:10a6:102:463::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 18 Mar
 2026 14:17:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 14:17:21 +0000
Date: Wed, 18 Mar 2026 10:17:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/5] i3c: master: Move entdaa error suppression
Message-ID: <abqz6_LvT3T_wZzW@lizhi-Precision-Tower-5810>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
 <20260312-ad4062-positive-error-fix-v2-2-1c933b5c7ed8@analog.com>
Content-Disposition: inline
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-2-1c933b5c7ed8@analog.com>
X-ClientProxiedBy: SA0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:806:130::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10178:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e27f71b-6daa-42e0-3587-08de84f91196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: oN1M0SB5M9CHGR6tnu5B72j0D0cwRIYLEhSC5CYn44L49yuIM5DitRPdfNisUY1WhQQytLu56DnD/n+/aDJIUir9aTUvZUhT13Fuf0gCN63vqcgWJWvJUaE2r7LSiq6Ahg46DbyimjF+9nBBBAkA63L+1BkAQ5ksJJ8fCG0+wDDfGULC6pbYWg3CoZfXAhnb8hxGRuLg1Zs32z7QMHEbJA+OclOughib0+/dIFKOwg7plTE0dMznXdLGQFfowlbX1HFtu7lYlIs32hFgoeVrww60VFT8siISCBWx+gZPQnH5nXT32JVKOloZ1sWtcUmwW3oIgOTqGLwCZO7g50iuQ3kgeAMakv+qKE/zVLc2xWoMd+nNN5xaiAT3O/Inmqzz1liA6SB1m6lYObqFwFMts9moicrqjdbwfht+bQZdlzXuxSefMbqM3of5j0rOLj0SYUdU6cuLa2M6/ncXugfGbYGB8OkcZ6qALC00+wHlSDjrMgsPcIKUu9H8qiWtIBxGG4cOnAGruQZGtYrPkxIhVkNO0DWsgfLmD470RhXIyPBPB33M0jq1lv/ZEc5XV8w8f5xxMVzimNAZKeW7n0BtqhgbwJlJZzSsoRpXiO7h7Xc4oXdrxT8IA/Fj7UWWxf0r8nXDHzcl1yN4gCAgO7wKaG8PEoKdx1oKaruvdouOjjsyp2ZELHq97oOuOIfTvnGAergRYpUJ3HViZcWcJ5SPaabk7FjCEUYrhj18UZ1BRjOEpLBJy8H7jbFGCvZjGPvP3W6SneNQhxMMWefO5JhlOYeDyaWLDS3e7KWimAIMWQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P17FNQ+unBcKT7wlJIybPRUmJwdIpImkyWAqFyXNFLLxPuJzCz/XERPn+poC?=
 =?us-ascii?Q?zQLWLPAIcKAVK0sPIXSLr+oTpk2fYHk88wvJ2o8J20Cs559B6WtT9tbjAj2h?=
 =?us-ascii?Q?sTT45m2I1qGK+sYwsoBjq/LjmvqfOAcmj0zMgFJiV6CmPud9QWdEfT4H59Is?=
 =?us-ascii?Q?rqEjGuTUipVcCKPQ/tlgaZ8ux3encB1LHg59nwWSZuzq5FtAOninAO8e/nnG?=
 =?us-ascii?Q?69etxmL22rbIxYoxKKbz+ZjJw6tlA1/8KxODbByzcXaBKLwv9de1/YYg++US?=
 =?us-ascii?Q?f8gfykBKkh1EwzaAPUl9iVE1pY1IXopRGnHl5ePxLSiSzGmisEdnTVmv06t9?=
 =?us-ascii?Q?fzMOMbI+GlN1oBJhJJ90kkcf+bSX3y6+QdSD2KiqbvWvwxG1fYSLDylb8Mar?=
 =?us-ascii?Q?OVv+YGk5aTwaNSsRoK+92otGr9baMHXTE7upnkW5qEV3iadtGWZQIsIBgdnz?=
 =?us-ascii?Q?uMU0gKGPgi9G9EpO8r79kQYypshx+FZYXWYaWm8QAXHKhMhQeKOH1JJhmoqy?=
 =?us-ascii?Q?hZzBkLLh/HqMozW4v3wLSR1owsHmXmwUffCQ/09aijPqY+MHjwQzoDOStVh4?=
 =?us-ascii?Q?wukw5z5pNUB2DbE1oLzv4fMl5galcCNv4bMlBtJW+ODplBe7H7CHqix2xgWp?=
 =?us-ascii?Q?gWNMWE3bhYS/kI8aFJlRuYWh5+G9lI27WNWUSqAKAIdf8ZYNCxZz8galOx2d?=
 =?us-ascii?Q?ua9m9WZaXiTkETwF8VwCyn+NqwzWNP4IzWPSFzwXtVT1G6uQtsIF8fvLDc6t?=
 =?us-ascii?Q?7cDct1F+gndW1AA516Fm7KoWm7cisUQhiXkYNtfqHHkVhCiwOXMjaoaWoCaw?=
 =?us-ascii?Q?+/jPr+j6QC6FpvIuQ9GUUOpxX4b949uT/BALVIE27ML4SyxD2CX2KpprK2Wk?=
 =?us-ascii?Q?cy8CzV9TIb8gXGIjBkFn6Jd42sDmA3QiYyCEuZBV+Btf6guyrtAtipDkbcon?=
 =?us-ascii?Q?A27juu7CzZ7vdPmw2wTr/q05FV2MeqsJkIflssvn3zo4A4GL/hIFHWtSbqCi?=
 =?us-ascii?Q?b/6w/KLuYxnE33LajnNuTECFjR7IwRndF+tr9bS8PkXlsJduwvpo3qSAYwwS?=
 =?us-ascii?Q?LAHy/0+vS9fQvOfKM4KUYZ5iZt7ny/yjzFy5/Q3RcJO9JCjT0YjudQvaX49u?=
 =?us-ascii?Q?cFY/gRfXxYYzP9zmces7we/vzc5OMus7M8jH+ianMAs/3kLhr3ih1XugyOHd?=
 =?us-ascii?Q?CYZxHoAb6cV58eILtwZr3xFZE7YjFBkRXPWJPFMEoPaQYdnyh3rBCjQQJHUR?=
 =?us-ascii?Q?5FP4hW3aMckhMVydP3cthJ6nh4W0h+Qmym00M+ItqN47IVoUPtmyPgr9PuQ5?=
 =?us-ascii?Q?vWUNvS/YC1ddaniR1ukyZ2hFEk5TYHEWw9rD9UpeTCdD5FmT/Jf+TWZ4Ceth?=
 =?us-ascii?Q?yKVB0/MnGgX5W/Pca9gWmMTuiNYsmUVCkkCRYM4uU/IP99tdAuLubBtabEXO?=
 =?us-ascii?Q?V5RCIiMCLxZg+iwXH7tUPPZiup6EoG2pz3mLLlWH532m1VyG3TD5DqZYdI2g?=
 =?us-ascii?Q?ilgDMZInJvFgC7pRZ3+vOLk5LQDcERyFU0wYuluE985as8sjGvvKIEFesRmJ?=
 =?us-ascii?Q?1XzRhZ+47IoQt1oMBWc2MuOxHyJatP83q4QCzmhsO4TLBGN33Ejpka0/6vBM?=
 =?us-ascii?Q?kiLkjI8EpOcenlUmFSIzFGKJek+xaF80j3u82r3TRgI2ExgqhEZCaiMMmN7T?=
 =?us-ascii?Q?CcPP24YOpeP+pInH3rq/O3MYCseVcjFRptpfWUdfQ1Wi1eat?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e27f71b-6daa-42e0-3587-08de84f91196
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:17:21.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5E7WouOsbvUo+DBXMk2OVf+EhhNZn4zzIcd8wW+FqJqsNm4xGF6MrkJg1oiP5ydHQxR8tvO/6uODnucwDWnPzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_071726_337349_FB7EB9ED 
X-CRM114-Status: GOOD (  18.49  )
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

On Thu, Mar 12, 2026 at 05:38:05PM +0100, Jorge Marques wrote:
> Prepares to fix improper Mx positive error propagation in later commits
> by handling Mx error codes where the i3c_ccc_cmd command is allocated.
> The CCC ENTDAA is invoked with i3c_master_entdaa_locked() and yields
> error I3C_ERROR_M2 if there are no devices active on the bus. Some
> controllers may also yield if there are no more devices need an dynamic
> address, since the sequence do always end in a NACK. Handle inside
> i3c_master_entdaa_locked(), checking cmd->err directly. Both call sites
> are updated, adi_i3c_master_do_daa() and cdns_i3c_master_do_daa().
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c                 | 4 ++++
>  drivers/i3c/master/adi-i3c-master.c  | 3 +--
>  drivers/i3c/master/i3c-master-cdns.c | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index c66f2655eb404..d4f9e7df4adc5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1050,6 +1050,10 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
>
> +	/* No active devices need an address. */
> +	if (ret && cmd.err == I3C_ERROR_M2)
> +		ret = 0;
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 6616f751075ae..fb9a488304469 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -655,8 +655,7 @@ static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
>
>  	writel(irq_mask, master->regs + REG_IRQ_MASK);
>
> -	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		return ret;
>
>  	/* Add I3C devices discovered */
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index b78aebf6b2ca4..5cfec6761494d 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1143,7 +1143,7 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
>  	}
>
>  	ret = i3c_master_entdaa_locked(&master->base);
> -	if (ret && ret != I3C_ERROR_M2)
> +	if (ret)
>  		return ret;
>
>  	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
>
> --
> 2.51.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
