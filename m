Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C32CD98ED
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Jun 2026 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKjebbUUdHGI9gz8bR3orKv1WQv8QJ5xFFIZAo1fHFg=; b=xz016u1vSOfu4J
	wkPHfs+EO258Z0bITCIVSME30++rkBtavwr4HUlL2s7B8MNu/X6ix9YXRFKvE/pS/+Nrp9oJS4IQN
	looD/BI6dfT/Vof1fSgVlcllFtKZThJjhnbs/8MxAX3OzeOQykO/g2/JowpLlHQtjUzullZjODM2r
	sQwiNQ6Wp/wZWeawSDRLNKXDuhWZdTb0tnsLLiF5lc4kbhierKcNuWtUksoKPARiqWmqXWWUm85+A
	IZTz+TYvQK8QhVfbEyIEkkYqRTmqPqfsaMyKTrvks89HXUNIUr9zxMkFRqCVmxff++1UFUvgiHxdg
	VcJGN2MvGx3FhFqF3JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIeM-00000001kVe-18oc;
	Thu, 18 Jun 2026 19:43:42 +0000
Received: from mail-westeuropeazon11010047.outbound.protection.outlook.com ([52.101.69.47] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIeJ-00000001kVG-0gfd
	for linux-i3c@lists.infradead.org;
	Thu, 18 Jun 2026 19:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYMlzy82er8x/ByKtneDtIMQLYstsYDTtbDNiyeaVli33M8baVjul8n8z7qCrQBgM/07Z9DniA3XSwZqhm+9YpJJtWfRmvu73I5ht2+zaMIXb2llP9ch/EhxwiQazn7qRPIV3uOoCpx6cVzC18Fk/YbebyPfQDVqJVjT8QG7+C9NKE5ZnLFeJGN7Nz4gDqjhvVY0PrQtwtqLbL0dt/FMIuBeaAPt5wvbIM1J3O2cD4lpOhD1hO1GaGOc9qj7ZHrPxLYQ6JJsR4H49J4mklwRydiBKJxvJxBbtjlbv0YkrYzbub+ahWQqL62D3WWQDHwBE/+PF8lFr1k6rD1J+7Rwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd2WYqViNJ8OQNdxSSWuuaszR4KTjgBbBO6bj2HTl00=;
 b=ASF6nPWWFWU1A6HRQpEAy1iWGWy2eO8wX5l/CrXA6EBCy4YGGEBHlSqcA7r1BLJhSL+hfQuJwBl22agOqhSx8XErIwNaxYXoHPnDWPsPKFX+CptaSMIaQbM51pa2slQG/QZwUhS3QXFbnkz7Cjgs5qY/UbI3IR4Q/hPHv1NdDc14rr//lDOuH4wjH+llPj7yEkF9tTYWtbPQC+B1JGppHMxuRs9z1BXnpGKdheHSMaPUxSzmIod0IrzZQ+QHkAtnj95EXHnD5PvSLvfw2YSD0NKnWAsBJhXhorKZ4u6wXMV30yn9ciZGEBqqxBBf0dV8tkGXoqzHLmtDmH6nv7JSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd2WYqViNJ8OQNdxSSWuuaszR4KTjgBbBO6bj2HTl00=;
 b=kj3A5ol8EihttJodWZVtexa9o5Gz8pCPpzWEbwhgPNR/k1L0GJo3elQ16fUO/tEwJmaAhmu3B9vA6JpFanGzecUZUsefPfvYhLkzOa6nm2XBDXeqakHKEVcKtHz51pSe8fo1kBtZPgKY1vRPIU47FsYoAxfL234quSg+NFs4hj5N5l6aFjHMKsBfWIrrQJbrKsFqBHPVoTT6S/8CATCcKoAL+V82SjhxqXixqN5WXfmjFqhQ9QWhDJ/PCB+ZSkaahgoj6nopfwyx+MnLHivBmDHSo7TODM0GvP+pql9L0N49sJfHHws3caSoAIO5ylY049hVCoLujLBc903fxr5Uog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6841.eurprd04.prod.outlook.com (2603:10a6:10:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:43:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:43:33 +0000
Date: Thu, 18 Jun 2026 15:43:23 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Message-ID: <ajRKW99hKGErGze9@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
 <20260616095429.3947205-8-akhilrajeev@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b6e69b-e22f-4f41-6917-08decd71e15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|19092799006|23010399003|1800799024|18002099003|22082099003|4143699003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jSdUH8eFVwVIkNDoUmL1PYDxCDT8AUiG6Eo6AHlD0TxYaXi9LOty26hxomHuFqVLv6DwVV348geLBn5yuph0M+Mqo1yWfd424J7JRCRjNeD/ByvFZ2FM02BOY0186TqytpDNvc+rOmT7Fh+cAQuRvRQy1br2t15Aprs5RjgZTWf4VZ7j92/X5t2H1Ob1IVHQ01fpPIzGEn7qNoGazg8OVFZoA935FivN8hyvRXsvhqqtDCNw3LnfIzVY6MADne/BdToHFdf9MUdwU0ttG38Q77SrX0awlXhtdN6GRS1MP43sIX9sHjvL7wbwW+34hdr8Svm4PcYiHLXhwi/Y4KXOg/Sp6KSkxc5x0aud/M5q+DYardFQ+PkUppr6USrlij4cGvqS1LckMmfK2mASq+eWPEsfK4C9Eovc4bxkhnfIOtFSD0OmWH0hLaJRCECMZ96EUE+3e4WDHcbvKHP+kUQwzkJ/hlll0Dgve4Wtkqp6cM12UfXAiDGHSogXxj9TZ0PVn9gU2VIlR9ExagfryAvHnXs0VBRJUU0Airlgg4kf5PjGPN+6Fwo4rPDom0TsomMG1wyRFE7FEao2fiRlyrRFqsCX44DqIU/ZtyPTU4LWIH+cdAvk/LHJj6Mhpaz2RGh8qOUOUXzbxe6crP1B7eq86m/auWq7lGOvN0e10bvh6kXnI3EbROWQN3FLXhov41dX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ee42uqKUIQR/K4OKVdGIqh4FRKv/GI4MZtk6zE6x70DDKZ3xBze8AMeQHpj/?=
 =?us-ascii?Q?Qaoy2B8AZYN3noGMVMee5x3fFWnD99cr+h449QhY1C/1IgxNYHQy+Mgk3mI0?=
 =?us-ascii?Q?5SfYHOUolV8GNZ+c3F4GONALC/TF5+jNcsNjnvz29cRA+Tg/bEGV4C4qDqu2?=
 =?us-ascii?Q?hNJOJ99EwHs4dwgrRngdOs73stIfCi/eriN2oWJLKCtMuuSxP9BB+R5OM1Xz?=
 =?us-ascii?Q?MTzfcUzVoflIMkKgKf9kFY/6TbvXYdCgLcvl8jQDp7se1DaH0gOvYLKVTTAU?=
 =?us-ascii?Q?9tEvsIn3A+LS7bSN2+PH5i3Ldv894wZiU31KY1UpFaJQZ2Plq7SCkv9ejqmx?=
 =?us-ascii?Q?OEAx6wYzUhnhtItCEb1fQ9GZ2xr0KK8bepIwvqzXUfUP17aoUy4A+tjHtrEq?=
 =?us-ascii?Q?PhPRh+ZsFFhQoLepv9iUzfI49CPMmp6LTPOx0wHKtFW7plCh8ue/eScaVnf8?=
 =?us-ascii?Q?vsVDiEdpv7EfgV09Rpc/46cJ6jl6b3h9WG6ZcoBOga4TRJa7VTW5bqrstdea?=
 =?us-ascii?Q?gzTyGQlfzVNErpVOUeMNW19XEEE915b+kJtkMS+R1BxORIV4nIX94qbAcuXD?=
 =?us-ascii?Q?T258XBLFEIGgQ8N4vq/0tJS3SA0clMM10U9ptsA0+m8G2MnNsOx3rw3BIAAp?=
 =?us-ascii?Q?HUhd11w2SqBmeQ7m2DtuGyab5k8S7o3TQ85cIwKNfAaFZqLfVX9TaMO9mX2P?=
 =?us-ascii?Q?bdwpOe64Z4tKOoF1IyPOK+w736nHH07ZvodyQ5G2m/li3+IhDHBqZeTlkc5e?=
 =?us-ascii?Q?3zsJxkhs57qlAAYJjDYGQ6Ll0e7CPJo73qt47RPsPlH8e+ANFGtDIZ7AvL/S?=
 =?us-ascii?Q?KfusVri5+WJSMcj2Mpuot7UG2UVWK+/dIFnYoGujyorHE87J30G+n7oJBwPJ?=
 =?us-ascii?Q?yHAOieAc5YH8UmgKpQbOg3vpmeS5b6b3ZO4El02Mq3bXLMFd7+aucsijOuE4?=
 =?us-ascii?Q?k+7iX3qQVe2reoKMl1yR/CCwdnLZAjrlwOWuKALkNWi2O2xUseXfLHU4rO6W?=
 =?us-ascii?Q?Tfftr7HAopHWhF59F2KE1W2EmoIRMgLh2bbb9/GoGns1TXsMP1m1nR/w/uJV?=
 =?us-ascii?Q?KjsH7dHRHBijpQ26HvOkaqOYjHuBKe5w5MLkAqhZlrfAtd0nmcxblHEFnnRI?=
 =?us-ascii?Q?/qqgRs8/Kig+KbhYiHWhIba7hWhJkytiUHVOCvbNLLYB1baomcv1Gv6UdOHn?=
 =?us-ascii?Q?u4EJKxalv+vsLOIYSys30uBZsGMGlwyXWnK7t2poPIb3Q6XMdxsLdp7G5JJH?=
 =?us-ascii?Q?h3L58+axe/4e6AWmYLKgUidpFOEoQ7Cmw9+USSYkem5TcFxaBMQSAXM/VZ8V?=
 =?us-ascii?Q?XesBhqTwAGbEGAvo0VxpUEy12r9E0qY+Vg2NvBaYBBU+68Z7DZ68B2X9xA39?=
 =?us-ascii?Q?b1sihQbh7UXa20YP9LYcqDJ0+ZpsJLhWV0q2ShDY/TwW0riFJVSpJjZ7sBk8?=
 =?us-ascii?Q?cqoIhIUEbrHnZytU8R1RMl1EiKUAf0A5dNGD3S9wkWqcDT0qyb1gRLz95/He?=
 =?us-ascii?Q?QWeLYAgv1TfZIYKuy4RfDlhPshkdqWdwE8qcXklDTnov1yEwGrpmj/ArcnPf?=
 =?us-ascii?Q?4+Uywa9k8W+J85j2+OzUrSwQpiaHGFiRFEO8Ng9Z84/HPyVgZhVMJg1vc0gF?=
 =?us-ascii?Q?cIgDpm8pbMcFhA7YiqvihRNaV00LCQPGKEXLEQsqC15dSTKGjs8vXHlxBi4M?=
 =?us-ascii?Q?IvFLZr513vckLfzImBBQnl5BbRcqIXtKxicudrjvouFoj3XUM8EaaH8t9oIK?=
 =?us-ascii?Q?FD/7pz6kJGnX42dqCwgHIlc04X8xhqOpoHuK6RR4BAx13oixM7y7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b6e69b-e22f-4f41-6917-08decd71e15c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:43:33.0639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/+Zrwgj3bJ+RVqFik34vabs0A9fU02Y7avY5FXiK5p9txR2Iz0dCN9fZ1fA6OwyNLCGFuFUqLesXgICk/Dyxh84dYBH9yAtQIwvqGSTEVAGkJ+DICCrda2zoWhkLtiG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_124339_209781_ED8DB55B 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, Jun 16, 2026 at 09:54:21AM +0000, Akhil R wrote:
> Add SETAASA and SETHID to the supported list of CCC commands for
> DesignWare I3C host controller.
>
> SETAASA is a broadcast command that assigns predefined static addresses
> to all I3C devices on the bus.
>
> SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
> are connected. It is a prerequisite command to be sent before SETAASA as
> recommended by JESD300-5 and JESD403 sideband bus specifications.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 971b429b76bc..3e510fddf06c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>  	case I3C_CCC_GETSTATUS:
>  	case I3C_CCC_GETMXDS:
>  	case I3C_CCC_GETHDRCAP:
> +	case I3C_CCC_SETAASA:
> +	case I3C_CCC_VENDOR(0, true): /* SETHID */
>  		return true;
>  	default:
>  		return false;
> --
> 2.43.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
