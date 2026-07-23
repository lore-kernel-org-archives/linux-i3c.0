Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810A5C531CC
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfBV5y5ya4hvAiPAKoU1Y9FxgJ//5UIN4/KvfLKLmMw=; b=Q2p3pQoOPjlhM5
	xs32L1n90XnQWDUMGShbvvq2wwSEBSM8z3biMTa3tqFShgXMQNtW68vwkm0ZKHj1LbrHl5n+o7VhU
	3ilyoWYS5nV6DCKt63P5q6hOlzCo7ctc7Kfl76YJGGeAkLh/xj8d0W23ugNy038drmI+CIWYJWThv
	veoYdkXStrpqlNN0SciC5gyF6dLcX4+qZC8vYT3CJ0JfJPCdQxm878JEUKHpYtGsCll5OWxEDs8wJ
	ZAQGprh7GzUAFIm0V6hwNDUKd0fAaVVDO9Pr7jM8Kvv5+i/NCgle6VHvxwDhehis2CU/xAadI8CFv
	cUQZ+AtEJVm7d49vQ77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxzO-0000000EsIR-1lmc;
	Thu, 23 Jul 2026 18:17:46 +0000
Received: from mail-westeuropeazon11011057.outbound.protection.outlook.com ([52.101.70.57] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxzM-0000000EsI3-1sI3
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 18:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/AG+GBxm+AEHSdMJ3dxPJrpLObSH+UJbzP9QwJ5tjZ4Up6UWM/pE9/KoZGRc19FWBvkYQ10pFQkyCfUBloQYmS4kSwMu4FMB0TAE5Ug6esn0r5Svtj91Pb6agcg0KVUU5l4nFz0qYC3nCw0rWLFWwFIhem8SPpjpQps6aX8z3XQUSbkeI63jqq2cZkS/795+BUWfXtEAwQZM/n6T6Mj+FVvlty3qQ9wMq5tyVp115xhWEtr+dY2gTgzaOYYCQcwIZXANNesoeOFkRIqA85rGKXvPgbwBf5ZU3n66TvBbWljChei9N5BqJEoKr1rA2cIMbIbfGVSpgzS+/wdhK1DAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCv20T8IBsIlMhjIKUlKsAEbciUoQbFoxii5xC0ix2E=;
 b=g13dvSsJpYlgmqnJcM6QAX1/cM0UHnerjA2yYS3yA5u4Z1VPI1xSUEioLbvtRicyxpTGDnin9EhX+KgPp8zFC2Up3R+DDF3/Q364DXe40oTGMFJ9lU89EwL1o/SlHLGNxDBnROVJQYX1p/94D1+hHPpQ+ScYyF8QvSA4c7C90ub90Bj/FwvZBo9zDlI0tdvsPvmmK+nkzQybcLtRtJP86rn6lemUjjwXNintiTpf1SvgG6tt+XJNlRXOa6JV/XFCqh0Yt89YQXcFqCSNZbEb+lyBcU9eV1Y0QZO05FyCyFV7nDDRCyN2uUDLhY8r6WWkBGFUsy4zMSB5hti6uTVDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCv20T8IBsIlMhjIKUlKsAEbciUoQbFoxii5xC0ix2E=;
 b=T6CwBRg4cs5xeuuNAbWBkdef5bx2zAUNk1XyHzdd8nQwiafVUcBGPET9J3VdmQvdCzEOYAKkiRV0aPV3/HSJyUuGRsQicb/+xIXbXR52T6eiJyDA4dSL1FnCRprAK2HMa6S1Yb6uQssJ5NdVfzI9EDDWLAClAWkqFRP7FMKaaq6HGmMQkqfAgYnFPluMaPGyRBA5RGoiUesWu9QRlRzmT8OPjgx/fejq9EkRUPkBUpGU26gc8bE2BJ8Wsxz9K/fd8g1wxe4irNgW3UpxJ1UJPaCN0Wxn8MUP0OZiv7QA8CGEpPJIrvKQhz6xLZUJGOULYAit64VotUnu/s+tmjKe1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 18:17:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:17:39 +0000
Date: Thu, 23 Jul 2026 14:17:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, tze.yee.ng@altera.com, lkp@intel.com,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] i3c: master: require dests for read CCC commands
Message-ID: <amJau9LgehYLnR20@lizhi-Precision-Tower-5810>
References: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b70bb0-3b1b-437c-ef9f-08dee8e6adec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: ejQIEmFdt3DY2eLR30rjM8WuaoDPF8JKMbyufwwKTQe+qGM7tbfMu2g7g4CfPtE9MrsuRRncdSitF0UhzRnKeNI7DqFRSxRY2VoKI3p/OGqt4i+GjgP7Kza0vXoWUhKbQ9iJZfL4HX9c3682oYYut7nBoKsIvJm0ZZCR8WQN9HO+t7/4RtU8+pJf3f4g/n/Y3Gei3lzJrcY2GBk0eqt3hXPsKD+UfSJzVAyPLcrraNeqjQuMqTVdRJQEKqifSdxq7hxH/wMAkTUd8S5gKtvIjudU6DVNQhL/VkR+b9CS0K2Adpumfc7egSuRDEXLV76BTs8X6NR7emvZ1MBaVWI5RsPjh5pNWRM+8mantwNWwOdRqXSGsC+ZQjoNAsCpxn/pVfKJFzVONcMfRUjgUsL/z7s/r5D1wyLy0aokPgMIJh95E8z3dUX2KcJWn90ju6P9vBdDtHL0XWwPnfTmhUH5g5+0T5GYEDWAxn5rSC/N7HRMN6D0/hSZcDT5T4zu6U1HtGx+p59FRqn4aaojCamS6+J2i5b5Am6FGk0/SJQwdNTxoVeE5QPUbLzdbFdmsrF2W5PE1nxfPNwNHKhNnCqA3CYgRSAJbd3HolTcfC2d1OTAyHmqOJzQk4QiWIxzr2J9vpxmDKa3oYU6Tsq7oVuriEnUEjS4YMSHemSzM9EE45Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t212r2NAHo8+SBCT8/ULSNuCGJSiNzUl73TU/JUn9r2ppNU/oXE/bHL9UC5W?=
 =?us-ascii?Q?PPmjAQuKEqhdVGa+51t1g6nAmGbS1EH2jP2WG/9glv7gFC+ZlzZuwKHqwDl4?=
 =?us-ascii?Q?ACWlJN+dNFv+h+8kc7axnBj6lnsYhn2Mm7bAQSVsW0kzhFnOJgoICqup6apW?=
 =?us-ascii?Q?PHXwWjvpE0/kKg2uNR/z3LjJl8Td36liCWxFNnKGKlFCbHbJysFs7p56BnXv?=
 =?us-ascii?Q?ctWFY6qbJAb19TIoon0705TrDlFZdb7jSVmFt3LA8GUqcM+lyHLDvptd3yRd?=
 =?us-ascii?Q?NFLzyJhBi7KEIZa9bLCkHPpX0p/p3A0R/b/bVogk16jKYTp+s3i+KM07ERT+?=
 =?us-ascii?Q?1Bhec2XsxGBjl04DvoJqYG40PMVW7waxT97hevLQSscN7mMo+1fan8nISoKo?=
 =?us-ascii?Q?mrpH2/+j0Tz0Uo6FlPcgmDNPESOAum8fJvHOVOze3keOrIEJbPOPOmvHF0XT?=
 =?us-ascii?Q?SWCJVEuJlghUOw8T4/2C2avPiRXVAzBOg2fPYwQiwoO5Z4VmM/3iq0nXBc5P?=
 =?us-ascii?Q?tHiHqcbc5p1FRlGyAdTyOPYxW2eIWrI1D97t8EVDtWkYRfrcdoM8LXJ4SWDa?=
 =?us-ascii?Q?EJP/jGiyIWTTKPKeAssdbLwNyrRzBzwJh3xncHHew9f0yVYegjaJhZ5D1uRU?=
 =?us-ascii?Q?X1KsQu7tmiFgEOOBfQ3S5dIgo5omSAbzhFb58kFz5XbuWkYttHr/w0S9gU60?=
 =?us-ascii?Q?5OeelbyjFfh4qE41cBMcPUh7I0jDBoyuLRcOkPZRKQIkymcUlnVSwbnmjMXO?=
 =?us-ascii?Q?7w6eofgngzWzNx7zxFJd1ewxipESLsXNhhIgbb3zA7IpPqSGHWm39lYX5Yzh?=
 =?us-ascii?Q?tDCDMtfONISK4WJwktPgeXilhcgO6t2kH0mxV5IQB5JEeN97Z5Kg0G77Tql5?=
 =?us-ascii?Q?YNiUyvvFh49t8B00JPe6MK0HfT4LZWi4J+Be9kUaQhZKuW0c/Gb7Lj0OghWo?=
 =?us-ascii?Q?cLmjcLSA0bZH0gfElx6Kc8Z/s5wZUctgHkcc5P3eJDXMmKGpF4mBTbiG3M60?=
 =?us-ascii?Q?v3YFCODeMqx77gM9hP+xRd31SLf0NGBtpU1Uw3IUlg8FE90Ary42Rxvb7yCr?=
 =?us-ascii?Q?qntQ+Czi3x2AV0PCIThrG/9Ahht/wFeu6DJV3ZiMD1Rtamoq5CySTpx19OoI?=
 =?us-ascii?Q?UDirBDjNSh2VPQoZPpyB8baEqaTmVLQbXdpxeIWvIrgr+vX/7q0spRzkhrPw?=
 =?us-ascii?Q?aB66wxn8/qdcvQihu83ybQGPwjx93eVncrQDgzxi8eb9qTtoRV9m2qE5hiZx?=
 =?us-ascii?Q?upru971znBaxCdl3LOeLkpGjZIzASqRKYRjfcdYuhpLLuqg83DQSe3F3MVWZ?=
 =?us-ascii?Q?dOf4AzviAoX5+54+e8LvRCVbr4PuULGEw/kg2QquzNog7vNQAE7ncpj9iTUG?=
 =?us-ascii?Q?Sz9g1gQTOm64OnslOs2Il9ckErmZ7TWIzOwWobK/4T1Iupu0vov7RG549q2y?=
 =?us-ascii?Q?fu5oZf1HUzi3RIsacoz1lwhfaYXL8/oZag7AivCEc/QXjct0vl/iGCoYYLSX?=
 =?us-ascii?Q?5IU4yl/qv19Cc+2+jFwyoRRGeLqtgI47ECaheIQR8TPfXI858MTajCEz7AX5?=
 =?us-ascii?Q?jl5sJLgFKsNu3VyjZB7LBCF4XCbtsD5ZD8j8TIleBWNnAzmsIRNSqo783ngx?=
 =?us-ascii?Q?PMf356PvVO28wERd3nfQY1BYLO2U/UN2VZdyQBEByS9kT2P8i/ZWDyJT6FED?=
 =?us-ascii?Q?Hb2znASaV70TDGt/uSDZJi2eGzXW/RiBaP6Nfuk4p2TSDUuODvE5ZTMJI1au?=
 =?us-ascii?Q?1j1ZZmrRpcIrWK1jQ1XcaUWZUZ83uWy4j+TsZytVayx24whj0KwH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b70bb0-3b1b-437c-ef9f-08dee8e6adec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:17:39.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cARyu48uo6Q/a4Cfu/icM0dZ6ykvzgpEW5Se2D3T6ALegFoKFOfQV7GGYPagOFJN+vrngy/BUeCZP7qsn4JdmWeY5leVMvCT3IFeB6PkvgjwUa5DKYUahke+VoMt10I3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_111744_518845_C4513CFD 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, Jul 23, 2026 at 05:23:10PM +0800, Adrian Ng Ho Yin wrote:
> Read CCC commands (rnw set) always need a destination array to store
> payload data. Extend the existing direct-CCC validation so cmd->dests
> is guaranteed non-NULL when cmd->rnw is set.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202607222347.TXH6r6ie-lkp@intel.com/
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index fd3e79d10c84..0249886d319b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1039,7 +1039,8 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
>  	if (!master->ops->send_ccc_cmd)
>  		return -EOPNOTSUPP;
>
> -	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
> +	if ((cmd->rnw || (cmd->id & I3C_CCC_DIRECT)) &&
> +	    (!cmd->dests || !cmd->ndests))
>  		return -EINVAL;
>
>  	if (master->ops->supports_ccc_cmd &&
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
