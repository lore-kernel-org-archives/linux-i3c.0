Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518ACFD318
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Nov 2025 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHwnOe6/Gj84kGPDAviIKWDvlv2GIECmrW8GQeEiGjA=; b=VYSdxvt9nxosuB
	Evg3o8lPaMp5eG8lp2djc89RKoRTfnSbAhvy46xQmb3WsAey/qT35bJVZqblRxO8uOwqKQDcfk+1i
	t7TBrPM3NekzcB5dDJqUZes8eQciO3Znyev8z6/uU7iC9LEMC+qCo1LS2r0P4vB97icWLJ1TMA+Is
	FzVsxJsR1v6UYgDag8QUR/nvZqd/Lyf3E/bmimktYmApUtgcHLLxS7h1XZj75rJFGItvh1E2quYxa
	V0iOmzU2Z5AzJq0SHUs8YzK6LiCHt/Bs6eSpu8Geq513a20uALdm7TWrV4EQ9cR1C5TpeoJzWxLao
	1rQwerklze1Mz9jH34uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaVi-0000000C75C-1pW0;
	Mon, 24 Nov 2025 17:38:00 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaVf-0000000C74N-2MZs
	for linux-i3c@lists.infradead.org;
	Mon, 24 Nov 2025 17:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ6Enxlq6IAo4tQ3QbXHwjNanhuIiEacuLlsjKIC6BJH92NdOBG7eMYIFdUPSiJuPF5JLJ/qxkHWeR9jICRAw/CWCyC/gwUG4VDGMVVDBc0vCPGVYg0XPWaFcseKy/Mm3j8cH4yA8gEeskUpp34S3VQb3jnL1Z/QGexDgKdkUfJ2RzEBQxzd75MSFnk6b/c5cZPtBdICW/QJRKLT3cjphfu4z7UKL/Oqng0mv/BU4Bj0/AiyJmN9dWeMXQ6j7L3w+TDmoXUpOGuIVBR4tllAAYdSqwcAs442Esc6M8pA5eIOeEctCwhDKZaXvXsPiBRvMXwvV4GmGYy2IQsIwV5Y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+ZrdFMheSfMUwO+eKYaJr9Fr0yBmBgw379BORG26Bw=;
 b=Bk/rSPRi2/ALbX5B3yX40DXJes0sL2I8sRLIsl5OPlKwWGcx19v1dXgR/OqxR8wzpAFblfUmhIAXqccz7X99QxLfbzFHh2gTse+dSZS0sd0Ozudc3F5DIQcf+PYlWADlsyy9I8C+Prr5be5M0xSsP3FzVlpfSg7fAjodjYEy324/msnx2lq09UquZ+sQCOxAd0MpoKxImEep94+zzJe2e+VHh8fZaqgnh11I1biNzg19BH17juUSy6P26D6sLCjZigznlV/ZTAwYb63v/z/ZJMwcYYPewlgvviQyTfpxfsMYIUkrF2pRdgdNY+NMwHm1/+VDM+w6r0GPsikS0OOkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+ZrdFMheSfMUwO+eKYaJr9Fr0yBmBgw379BORG26Bw=;
 b=FEIQLtjQ/TVHhJG0mmLHs2JojJR3j1FTtODo9tNLET1ClvbzbhV+V0kLUmkf+FVroJgImqHBaUol9Fll+QvfognY1S7Y2pJvK+vNGhEy0SEDeP5+7QBaqrtjhxzuNiBv234DlvJ79ka1b6DCIKHMC7KEahmURiOpBHJfu06UIPhQspnMzekoAPnh/tP8iJ+M3iuQHxs8SHu03EHzkbTkg4+aMIkb5Y4Vb7BGJN4fxFPoKPecFy0YLvNEXOPYocH8sse8uRT7TPhgHf74xJ7167KEwwj1R6uV8qCY2QZSn3vMoa6QwYszlap4rvaYLTdIHYadQuB1YxbVpb3cAPuT4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:37:51 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:37:51 +0000
Date: Mon, 24 Nov 2025 12:37:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: add sysfs entry for Device NACK Retry count
Message-ID: <aSSX6JnJEeTAOUPX@lizhi-Precision-Tower-5810>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
 <89b235bf116bae9fc573772c4f52cfc3d2d122b8.1763703573.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <89b235bf116bae9fc573772c4f52cfc3d2d122b8.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: ff11e790-fa10-47a5-c762-08de2b8030d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WI5GCwXp4y8fNS2lhxF48u0IrXbABSWFBxp20bqxES3JLnvln3cJ9kzlpj3a?=
 =?us-ascii?Q?ZxEGbitdQ9NVikiRa708f7GdYJDGIIbb+evVaO+6cz6ztgwiCzqLg+Aw7P34?=
 =?us-ascii?Q?XCTRcqjdQoJNe051XhvnsbBWt117WZXNNcGtEwZOi8MMrfh7t9VjKGjDs8lP?=
 =?us-ascii?Q?gaBn21klUbtBeIi+sQt061myOBjhfop1caTGIGkl3SuOEhsO1+SKj1wOnJX7?=
 =?us-ascii?Q?73dUDxOiRYp10bVTPClM+XiRWC/JMJk6UGi0WTUi4nPJfSQNhkzWuTTy6C5L?=
 =?us-ascii?Q?DdgcnvzFl9cCMz8sL4Hye2zdruF8YkGoaY+sJ4LJVhf/VnWa5DxG6nfe2u7L?=
 =?us-ascii?Q?UCkM9YhmL4m477AVpSUyc+0nISJPQw/8whTvuOGBwLqs6250yRq4eAyK0P/l?=
 =?us-ascii?Q?dtcD4G7YXZK0S1NJCvXyIc0zp32hYzzvCgZnlZzHstytNhQnDpwAwTBbIBRA?=
 =?us-ascii?Q?n76yqZU27FlTDM9H3QwL1WMc16t66FEkkvGwXDP4v/L6KTXu28DUuXWITySJ?=
 =?us-ascii?Q?0AKwoKWPCaQ0GUYuQdmyBuMGiqGKUp7r0H99mKVEiC8aCyRAi9yx3agKEyow?=
 =?us-ascii?Q?Y8P+gqC6d5qXE1GdYzvWGDTmQ0BqeyW0okCnijfRsdf0JuwACglFr/IWKBwo?=
 =?us-ascii?Q?tQNoF08/x42k5HBNEqJcEUonLuw8YzNx2Tneq+xvE482YsK14T09yY5ByUkZ?=
 =?us-ascii?Q?90uxMYJ/SzUB1anl6clCMJjxYW7MGSswicaL0FojCY5VMSyOdZ5Zzs9zbwMv?=
 =?us-ascii?Q?QmEUyzZ3wnWN6pl5iuNBP1lidefHzsubHrwl9tV/lo+yqa1a/GLIzPdRKf68?=
 =?us-ascii?Q?bQ6Uik6kiF0qJB9dbnUNbFMwnHhgY3wA334GaEaZMQwY+A8b4O0nqxIOnzAV?=
 =?us-ascii?Q?vEdPNX0cwS6uAvnL1h+2byavwe3xbMErmDJbsbQKmunlMvz6SoqAjiYj/rV5?=
 =?us-ascii?Q?w45NW3Il49S120G0uMo2ees8I0QBQLSBLvmaKukBZzJAPgtZALyIG6dFswuj?=
 =?us-ascii?Q?CPeH/UQQS24taqNFrhbRudkK+MFmquKFi66mtVOdGVOPR6Vnn5UYivtzYr8a?=
 =?us-ascii?Q?X9c7/tBy7nGqJFCgBmmSLwHfM/1xoql2GIGgPbWIXquqQN5Um7ItysSn5sik?=
 =?us-ascii?Q?ZlHjmNddytUrHz1jUkcNuJ6issGYAJN4s7BS3yqzs/u8rzqZ1VjFHgxbp+KG?=
 =?us-ascii?Q?iz+zf2qCUG8HAfO3Gb6Q473XIdF/j01YuXawPv2qtJZCVbVpggPuIhJCGicq?=
 =?us-ascii?Q?uEWLY5Zq9vaspk8MMH4dTsdyHI6nTRpy4xC/XkpRwRA2iCGpGZfyo+MueqS+?=
 =?us-ascii?Q?A/zwIlxqeSfFr2i2M3g+LkSAwR7m7C9Iu6a3tKJbZFk7HD4QpAGoIDDN2tqf?=
 =?us-ascii?Q?8zwv27d1sqsEO7IvvNzwpQvXglsg1DRLNElXRcwvvmERohL8QJ66Nst6k8w0?=
 =?us-ascii?Q?QYp/R6W81PhhlCl1Z2+8g9Q2Ie/YOA6lJDoXxWT3Tttkf/FuNyVYuGlsp+Oc?=
 =?us-ascii?Q?fnZ9X+ROiGp6I6RSPek9K2Ah5+2QAeVJnyTf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+QHfoP4UhPAosTVN6we8+YtC05VXdHniiqos499NCcX07WMBQuENYkiHFPYu?=
 =?us-ascii?Q?PFUyE98YCeXCESWr4E0icgy1GMogfga3KDqlnQo+THnBTRUQhU0XMTxj7Ejh?=
 =?us-ascii?Q?RAVdOXfMhcKlrw3HiD0JkVXEUy+pqapgIfWisjMg3vZ95gbEyP+Bms0t/I5S?=
 =?us-ascii?Q?A0viW7C739uDh6F0vAqeiup6BegsUjmJHI/piGek6ObICv9ObcW4cQVK+ZXs?=
 =?us-ascii?Q?k5vYBv+soLNxhgKiJKQzgIId4FtACG/rPEi3KXa28Sjqxw792RPproC2LzWx?=
 =?us-ascii?Q?RunGk5fCePgSRmnR29m98BZqFKTeaCzDXuSlXO3Rrc2tGyur8uojynPUOzVr?=
 =?us-ascii?Q?yJrEP4EGI7FdUPsiEfWQ6LIJbsa2b6pvGHySVhQywSlCvVImY5souehMC2NR?=
 =?us-ascii?Q?p/J6G4VrkgCw4e+ORUKNChRTIKEl1ckEJKETjYxuKElyuBGQiCov80ew14Nf?=
 =?us-ascii?Q?gEABAq2ikXT5N7NllGq+MBVeg7xqZkgUGJv4bcSelx4st/KVeXtBdRQlGEmq?=
 =?us-ascii?Q?v0EOl8P9LhyuOkouk92sgtI+fuFxbRKV6ExXkSY9SG8JPkXlZMX/XFY68ppd?=
 =?us-ascii?Q?nQLH3FUHHx+zC8cpGgHrraZzfKi9cB2R1UBDLmi+rhv4vEwu9/ZWtE1Qe/Ac?=
 =?us-ascii?Q?ZRguKC+VlC9lGIeMBKB4A7RbxAFxs58ZdexV/RolRdAUJbvWQA3LPFgr00RS?=
 =?us-ascii?Q?pbNMiCJpqGg3Djj1rY967if0haMoaZhBrBxQHj8GJWla/Z/GeX43TNkD8z9X?=
 =?us-ascii?Q?NDocfjqC507r9dZIvfoy39njbykin3vOJtWPiM1TICCUJL5sd5xRfDpHLhKy?=
 =?us-ascii?Q?389nvbLlS3g1i6goDa746u2TZ6EDo9uyReqQpwbHhc81wK+MgcAzTEBS10ie?=
 =?us-ascii?Q?H9UjrxuJfXpeNpnKsReiJpAcy48u5gnCE/Jd2MoODPtKi4grnQ5yVB2EJ/5Q?=
 =?us-ascii?Q?dlksssVhoWZRRYfQqHxp6wnN6jDxlro+aPJ1TqI4tTfhrouUP81upuwf1+zo?=
 =?us-ascii?Q?JfDe2JsFcXs/ginAizgQfl7Zsa3eN7Ky31X3r+LmCuUDnMpchuWdqvtah2pD?=
 =?us-ascii?Q?gKzIwNKR8PutJoaIkkhFye31nBVBv5ROPoTQZKj91kx3Na94pR8YFkn4M42d?=
 =?us-ascii?Q?jVxqMGmFtqSWLMj9pLZyHMn+FJ/bDv2WUvBuCwFhtjYHWVV/AuE1XpS3bs2A?=
 =?us-ascii?Q?D+Tk+sjJsQwSJsrfziwD38TMZhwsJSHPDVMOpKaStj75Jopvg/+6tQtN7UPr?=
 =?us-ascii?Q?oYem4a1MqaC9dBTNFffldMrOlPHOkRNjWdEg+E5OC1IR0Xp9mhZThNwAbWT+?=
 =?us-ascii?Q?wIBp59IRhseQd0W+MvRzYNzQdK2cWz4mLfMyDU3QXkxskktegydlBvjSBKxp?=
 =?us-ascii?Q?d+KAHsem22yLh+Y/xC2OxeodWW09/oBD1EUnzmxVSHVG8auHvoo9DI8eyV6I?=
 =?us-ascii?Q?hGzID5w3pTFVzLCgKBxPOWR3+rlyno2rtHRWFXHtDaKta9S+7iJml6OsNvH1?=
 =?us-ascii?Q?xtHdAZxyNxmAiQYrhg+JGOfR8ioWS3kjAVL1nuO2SXyXAuAyiktlZBveIryD?=
 =?us-ascii?Q?RIsVnjqcr9iPzTE2KHbpDIjNpANkrZ+t4qboDUYe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff11e790-fa10-47a5-c762-08de2b8030d3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:37:51.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iIimdaIVOVD04iv/bGe2ysu/+sXcxQUU//gd7f2jJMnN65V4qWNZEEcvUy4heekMS+uYjY329vLmDys1dSQQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_093755_605399_BBD8BB6D 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, Nov 21, 2025 at 02:21:48PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Document sysfs attribute dev_nack_retry_cnt that controls the number of
> automatic retries performed by the DesignWare I3C controller when a target
> device returns a NACK
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/ABI/testing/sysfs-bus-i3c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
> index c812ab180ff4..d75339330067 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -161,3 +161,14 @@ Contact:	linux-i3c@vger.kernel.org
>  Description:
>  		These directories are just symbolic links to
>  		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
> +
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
> +KernelVersion:  6.18
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Expose the dev_nak_retry_count which controls the number of automatic
> +		retries that will be performed by the controller when the target device
> +		returns a NACK response. A value of 0 disables the automatic retries. A
> +		max value of 3 can be configured.
> +
> +		Valid values: 0-3
> --
> 2.49.GIT
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
