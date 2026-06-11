Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E0BCD98C7
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jun 2026 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCe/6403PSfzPN8Qb0BpkPXPILjX1zMkHk2HdniVGT0=; b=SedV6horH9I/6I
	cs01h9hgz1R4oGgUyFRNL6YNVymtfYUYCjsTEXUU4RECgNxuUMk305W4Tn1gx14chEKILVgWwhzkm
	WEipY07TA7OeYz5yOxNtHNds6bOLcfP/DFphbHhOkxoKCpseYy3VDjSqea1qUDeK3Aihx06E2dFO/
	GXIR6ibDhUQJQCqlfKtAya7gt022OLUOfxG0ABkMrJlDgeyqw7buUSeVNqUOgWPUqFXVzHQDbXQhS
	3v4IZ74Vb1jb6N1AKdexhoURu+pxH3W0iOY/8DPkGHwoL0H9C8kHn4tscGDZm9YLbd5I0VqN2SYkb
	bEjsOvntbVsKP7G4tdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhyI-00000009jhi-1CNG;
	Thu, 11 Jun 2026 16:09:34 +0000
Received: from mail-westeuropeazon11011017.outbound.protection.outlook.com ([52.101.70.17] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhyF-00000009jhK-3xs0
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 16:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfew3gEDA7wlIehxqye2CE+0ebQDk5lMIf1skBsQqz/AWdYXee17UsVqwPmaJv+2ad/k/Ps7l7YN6Cy+7eV2omXwR+p73Tc3J4l5VGf/+2IdCLwu6hN4thPb64NCNruxWCJ7kZGYqNHzwQ9ePMOjf3ZCUegjUqoD8Hqu4lvGBRCL/k0cn38hpqHJqBmkuhzVRBljHKlYe7HY4xrRNhxfHm/rH273sYyx8pOk3QWMQ+byI3XSkQ6xfu2P8/D/pUx5w0db+bLFW/bcItoKJY8lhoDvoKFo0sEN020fyGe8HGfGFcF0AZCCnbBSoAYXxF/ZVk9wJQTy8V+/7R1Fym9RkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJWs1KgrcHsX2+LIA0fS6uClK6rG1kccUfBRJu9GGaA=;
 b=PwtrseUgIUCKXW3VbJSwkfuiwvfbsI6QIfbB/LrJ04c3aWB5qNNuICVJkTs+CftQQtky56Hl/KJgaFhZcyCtDF59Xa2vdlMv613QRIXzh8z7I1H7wPXF+ih48muePnLYJjWPLcOs8gCmNy37hKmQLn/IdGNipsh1082PTWIE42huzIb8UmJ66TV+vqhL9oDgv+9DEhETHJ6goG3OtjJN7yeBpdUb6v9JprEZCgGbbUjvr/9BUWsD4Mv3lHEIGKSTsF+ySjAbg7FF07vnNHHe4JL3jo3TRuwI8G0rxwbE8lPPhZIX63v3ozbW3gSRASZDPMgpjcAnwx9OtICmvtHmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJWs1KgrcHsX2+LIA0fS6uClK6rG1kccUfBRJu9GGaA=;
 b=Nm+rYZIYDwf1hcfjqaiDRwI8kd4n2ZFTZspvUwx3bsUz+UtuC/xT5e9NGheZcAVwQqsvfCg/FMC9hYyFlURoxI9OGPY1fgHIOX+GuYGlOjS+5g9blbJ6P+be+dB8TDdIvvGIN2SmXfSYCorfQdNH8nrGVoUOwRcbvmRCDKOMHtIwNQltn6v5h6L30EjwTkdVE4pbyRI6L68SJyQUnVltK5dAucW8Auqc74ryoPCq7ua4T5Di40mXDbzvrU+SHie6FqZvM20E31EOGiTBV4Q2ELzut8WCn/lzKWpERrSvyGJeSm0wwwMkutn1WEHxAlIx8AyG+w+8FvB9k50DM5XtLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9268.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:09:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 16:09:26 +0000
Date: Thu, 11 Jun 2026 12:09:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/7] i3c: master: Prevent reuse of dynamic address on
 device add failure
Message-ID: <airdr9kCb3c-vZGi@lizhi-Precision-Tower-5810>
References: <20260610072852.36934-1-adrian.hunter@intel.com>
 <20260610072852.36934-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260610072852.36934-4-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:510:323::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff1abfe-e19b-4d97-d8c0-08dec7d3cf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|4143699003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fd+0VX5dWo5ZLq9TLEl5C3FeDXC+eDVHgUw2rlat9a25dPtcoHzyYAx5VM39pC056SBwn6m4LbvS1jQyXWggwXw+r9mFBcaU023CnTcStBwhMvH138rYY8m+JVAUFLBNvpOWanpAXnCHM7F+UsRpDU5JzfhuqFerlE6Pxq88JIa85uNYZ6xAumKjQ/eX527QOqZSAmx2lXnEGzzFaoewbzXM8TGnAu2cOS4qlvrxLXT4Lt5g1lQDOQHZqWhkLA996swU2Fu2F83XE7vZmb8ipN4cKIzRAyDLIna4a/L/1B0YX4EQdkMU5AekIhhHSHM61/8fiojRmPlD/28SxdGauPgOn4njXIg3RBUghWyN2ClXFhSgVj72lrLN8mL9I/QkxQi0JN1PQEXUGOx9pauej756QQH5RbSo2/jkycC63vmFewXJ069BjnQlbGKK9zXu2Jkxq/Ev+6jnehdAa3fUYG74vzGF9/KuSxJFT5VP8h+WLMvbH3FCyHOYTxI0tzMvMZJpLP7l/XtwRHSedWfy6jb3O7CKz8GzI02doeXS4DEzkSBBc305c2t2ehDRw7Pqswg/Hw+cVD/rDi7fVx1GX5Hexv+VvhKBfYgfq+vCPCml+OmjebvLfnQJIvR3uQSCZJMIkASPm4vXNY0nNu6ICEI7ElssKFtxK71jNPyIcSzfddPyf7kb/xLnsU9+8CWC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(4143699003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EBSf04SNId1oIqJwLaJNZiDxxrkhwiLAxOLa5es0FjpTkExVDF28SWCp98ch?=
 =?us-ascii?Q?5YPTnPHPcVg6GzsGkSQUWxL+64VXYpO/4ozWWR4gFtDFiA3huqkTUDa7m2Uo?=
 =?us-ascii?Q?sLzkaK8iUyy2fbVAuGUZWBnl/9p7u0COh4bujUIQkoHb9f6rAywH4FcnXldV?=
 =?us-ascii?Q?2d6ezAKqTnDKWy55cHrqXoDe1gnqkPb1kjBcm402fJGeyiy3DUcKXw8mbEiV?=
 =?us-ascii?Q?Q3o4W03XpOwWDvpxsnQqDjAi38xn/zGDN+Z9+8Yl831V3US2yBC9Hha/S/zw?=
 =?us-ascii?Q?IuxptUpJqJJbBVp3ViIlkznlSVsbCTfqHrsCY3EP+w3FJqWM6TvEUA6bmvDa?=
 =?us-ascii?Q?3tdJQ986t0UDY7Y9q3Y1ayKD7uOV3wnf4734wwIUePdrlzoY7EaRGpF21Cq/?=
 =?us-ascii?Q?9corgICYs/qbVVYkbNyZMHQ8wT9JS7WwHzO8sMS59+54GgbRh+6qlHKCoz9u?=
 =?us-ascii?Q?HsbuyuR0hxg+zPPsE2Gp9irdePg+CjqHvxT2xwlAjYOg4IZF8KQF9bsLHFKQ?=
 =?us-ascii?Q?sJ4vQXDvHj6gHi1w5B7dMl8V0Z4jM0Q5C4LiTwy9Lxq7kf2OlleQntX1jsqj?=
 =?us-ascii?Q?S4xFr0HqxQ9d8J6h9ZSpr6fJcSohUs0slpQesdGGpAr7djmfBmg6ETqPsR0j?=
 =?us-ascii?Q?QITKbpFSVwMeql1225GdTG8ogMK7/5fklXCdv3pQC1dhWbLzCsAl0iJAVcAP?=
 =?us-ascii?Q?9iLEu/3ITb2AlSzXN82LSIrAgtZ0QLOOrw/SQo/vYPP3HuDt01MN6lJvSV+A?=
 =?us-ascii?Q?F93Dg9ZjvuX/VH4GDkqvoKq9wGmxN4oVD8MN3TX1phwEPZy1AJOxGJc4WhGk?=
 =?us-ascii?Q?iBGNAHLSaYO+hWkBMsaNKoRZGT91ovr1zowKfJZuBoKs6KDDV+IoeGuzUKCe?=
 =?us-ascii?Q?Iw2o2YqTHZ/pRSMswZ4YU6n08mCiCdMFULp2aFYHnkp1GTREMdUDvpR4fwlt?=
 =?us-ascii?Q?exMfwUfBuWpmDihjugcVkeYMfs0T1+2rZH6s+PXDk/Qhoy0T/s4WI2SbovRI?=
 =?us-ascii?Q?SnLb/tgEgKZaf12dXkaUHdf1uJicPuJ4j0he8ssyFid2oshbPS1sN1LL78fQ?=
 =?us-ascii?Q?ZM9R8kscbcpEMoNgeGeTNAKK6J/S8NaDYZMf8IYb3ra86tOfBhnBW9WoePUo?=
 =?us-ascii?Q?i+emgsYaX2fJD/qzxdF+rUKi9Dul34O8Jg0ZDlfwdQLBGIY52Br9qfpz2AsU?=
 =?us-ascii?Q?OErdG1tMxSzQHA1mY3qQrrrpCHm4f6e3ixs2KlSd3Wwd4hyl0n5Hh2H9Uwaz?=
 =?us-ascii?Q?m/liwyNQYQlLa00h0KnANtedwq5XvL+inrjPCJahLpw5O3ZmnZjyewf+dhqK?=
 =?us-ascii?Q?wan6h4lD5OszSG77PL8XgDGpzagAgCgK+w2JGrTBumT3VS597VJT0ALdtX/R?=
 =?us-ascii?Q?BgwWfSaZY1rXnjiMYhcR6QWpYHlyP5UEIHbc9jUu5VJCTj0ZjWxU+svbRh+M?=
 =?us-ascii?Q?dELS+93KyQqxp2RIi98sgyMFxCJJMsZDILtFZ2lgC3UqXbPHPx/WWkbGJiZE?=
 =?us-ascii?Q?mr9/njCaj/9FIkrcoQllZaHZHaJawANwi5kH/8cQkmzEFWepB8ROnKyXe3Xm?=
 =?us-ascii?Q?Z/cWHNg2WFFahejBJjd5XN29aNcCuY7HHMV/Rp1PrbUWp4nG72e4ahMAT1qg?=
 =?us-ascii?Q?UYO0f8cCw2+8c+9+33fzHQOKODOwvYiA1cAI2EaSM5dGsqokkNecdzP4sZX7?=
 =?us-ascii?Q?122XngOb07KAiDEN17yWr1ojV7otXdEOHGxQe6suj2w6ka+B5VtEepvae5q7?=
 =?us-ascii?Q?O3BYdpIG/7sSuCtSXyBehvfxBrBDHHdzV1cstGbwVGE6uyv4nDuC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff1abfe-e19b-4d97-d8c0-08dec7d3cf2c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:09:26.2709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfcuI5/xNS7lAnZ74RO6ebhDr4qRrNMV5A312t1OJF5hJAXlYe8W5UvODM6ZmdHuYnYdBquvgP6JR4eyMZIFwCKKZhOYI81R9LTgBcAtjDI8FEMWxWJFdX0W6gsFocdN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_090932_005214_1047EE16 
X-CRM114-Status: GOOD (  26.66  )
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

On Wed, Jun 10, 2026 at 10:28:48AM +0300, Adrian Hunter wrote:
> i3c_master_add_i3c_dev_locked() is called after a device has already
> been assigned a dynamic address.  If the function fails, the address
> remains marked as free and may be reallocated to another device,
> leading to address conflicts on the bus.
>
> Ensure the address is not marked as free on failure, by updating the
> address slot state to prevent the address from being re-used.
>
> Emit an error message to inform of the failure.
>
> Opportunistically remove the !master check because it is impossible.
>
> Note, directly resetting the device's dynamic address is no longer
> an option, since Direct RSTDAA was deprecated from I3C starting from
> version 1.1 and v1.1 (or later) target devices are meant to NACK it.
>
> Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Add note to commit message about Direct RSTDAA deprecation
>
> Changes in V2:
>
> 	Fix 'if (IS_ERR(newdev)' error path.
> 	Be defensive and do not change the addr_slot_status if it is not
> 	free, and update commit message accordingly.
> 	Amend commit message to note removal of unnecesary 'if (!master)'
> 	check.
> 	Add Fixes tag.
>
>
>  drivers/i3c/master.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f87bf0099d3c..7b60b0c7f646 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2345,12 +2345,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	bool enable_ibi = false;
>  	int ret;
>
> -	if (!master)
> -		return -EINVAL;
> -
>  	newdev = i3c_master_alloc_i3c_dev(master, &info);
> -	if (IS_ERR(newdev))
> -		return PTR_ERR(newdev);
> +	if (IS_ERR(newdev)) {
> +		ret = PTR_ERR(newdev);
> +		goto err_prevent_addr_reuse;
> +	}
>
>  	ret = i3c_master_attach_i3c_dev(master, newdev);
>  	if (ret)
> @@ -2472,6 +2471,16 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  err_free_dev:
>  	i3c_master_free_i3c_dev(newdev);
>
> +err_prevent_addr_reuse:
> +	/*
> +	 * Although the device has not been added, the address has been
> +	 * assigned. Prevent the address from being used again.
> +	 */
> +	if (i3c_bus_get_addr_slot_status(&master->bus, addr) == I3C_ADDR_SLOT_FREE)
> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
> +
> +	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
