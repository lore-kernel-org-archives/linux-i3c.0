Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0880ECA0EF8
	for <linux-i3c@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRV7ZZ6U5MShn+pP/L7mkFEbv++jKN7XWK6r1af8KEc=; b=L/zKkNjMXBIfEp
	kfL4QL00Sb/azm7OanNlLB+N+/+MJbdtazmhFgl0tp7dXd75rH6rqrbeGn3f1tYJ07F9D403mivHb
	zYOXjNtpUezl6Xk/pxeCue5jlnVfv77YWCr6vvDzFAesCui0PXEl1D4XZnLRzJlsJonqodGBPsYkT
	7L8IaCr7YeG4Dp4oupE3Iu7uw8nHPy6Zb4pxvYjig1ogBAHjyKm2wDbpK70HCPQqQtV9XGVTMDpjm
	HL+BkdlXaBjm+o6Tv016cfcI1rycruTBAQssILRGR452etY3xLh59XZwNF8DGJ90AFuJDVrrIPCP9
	ypsoMLt5+b96qaVUgdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplC-0000000Et8z-353N;
	Wed, 20 Aug 2025 20:50:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolQl-0000000EMVk-1NWQ
	for linux-i3c@lists.infradead.org;
	Wed, 20 Aug 2025 16:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9PMM1HqKyBA97DSDiO0pwUmKDAYFO3aRhCnDarFRQyrrTGYFv+EfkpWG93xA1dNJn1S3EcXxs/pAGUCzgyVn2xcvDdKqdVyC/nj4tqo83qPuHjzBPjFY6LPnLTKSrkv11qrJFLbaFfS9i0xPFEXayrvWzprxZ68SODW7E8b8XftwSuSJUGK7XxCqw1rxoCZnKHUFljDPHHHynhMUZnWtUpu2trhL0OqZ0xS/vDlAvxG5mYzi1kbWTMDFF/Dbk9X3+bypnjfPdmj9q9hTF8SPDN9tOzYajHZPX9zZ7uFcpYn9j47700f70Bog8lVkT+gL2/P+HgBYv1f8nVh5672GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+SHt1JQd4obfIfO9xn3E5vat3pgP+rV1hMvzYfwwyY=;
 b=oGEs7QUPZR7tVEL0oI55Ui3QrBc809FXLaUOQ8+YItCRV8pLWOsi+D9llOzt6u+CspGsichh+yXjy8ZzphiqXm6jbOmu6s+uhR4cKfROeCx3/ta97YyLWR4BK3jclaDKeWiP3ungi2SXVlrH9G2MrBXDGPTvSYT3aoTb07hzMCz7BrmDdSMn+IGcsaSiYYYju0oXhXyb5BoghnSOUiorqWPrxI4/5rmk1tTVJFYr1OIMSJis47vik8tHeSEcOcNPapNjZML1cndvlj95QRLUZQIDtn4xix10kjgCk4ejZk9ahams1o59YwrU+Bl1FfO6ah17ZCl3+xW1JVMCfKfV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+SHt1JQd4obfIfO9xn3E5vat3pgP+rV1hMvzYfwwyY=;
 b=WMlHoXlf/CCbJEFDNEn+GbMjxduUkpcStU9fIf9suduY6v99OAVDL2KuI7h1rn+aHza2RmtRTgRBmaI8db7li8MhSObC7VqqiD/vZCQHzPDw0Ad1NvflD7GobRQH+3P7mYOI92A172sg3m5GvjVpCr1O0tYQUoAchEHONUEhukew/Zx3N6UxmPMYzOvqmoa4mbFUgVbtHByylHmSqPmDbPJezcFREdhWFvBxuOtni8yLoGVz3gebXD7rQ7ktPPhKHMsqJSnWAbBojwClcY1sJwxOeTO6EK4BT8gxWlBhnFbsnZlBb+3KP5pnTf8iRJsVIVN9oJ+HZeV9/To2V0sqIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 16:12:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 16:12:50 +0000
Date: Wed, 20 Aug 2025 12:12:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH v3 3/4] i3c: mipi-i3c-hci: Use physical device pointer
 with DMA API
Message-ID: <aKXz/EZj70ls5uvQ@lizhi-Precision-Tower-5810>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
 <20250820113447.2502071-4-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250820113447.2502071-4-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dd07dc-1ff3-47a0-1a36-08dde004691b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?04F/eaqYONHqd8IkguBDjN8ZwgKj5Vr9c1Ho6DE7g6vw63MjGgtc8GhnncJd?=
 =?us-ascii?Q?ytEqT2k9/XMOGj1m8qoveoPUtYPwHuSc+zZ1Y0eT/HAQui0iD7L5/n8BkWEx?=
 =?us-ascii?Q?miFgPnxIHlA7vlkOuIi+S8yO7D1jGWOx9C1s+Xwy5wexd12cM293RhiA/fM7?=
 =?us-ascii?Q?084vqySuf68eaJRZ1xati/qR3H7lz501UnJOmufuNwqOVqdqpTEZRQ42BpGe?=
 =?us-ascii?Q?iDXOqep0PqeXqkm5aCHvzbT3P/GhrrT9ClrdawKAawtJw/ad5UXeWPTBDl1j?=
 =?us-ascii?Q?F+yXcV0kpebLgfM42R+JRR8PQwhV++VdG/+YYAWUCKnmNn304IDcIjgO2tlV?=
 =?us-ascii?Q?aKdLbJIt4dlH9vwWniGw3j1EC513NHAiLfI6ePtjoVZLJ7IAeafd+6XDov7g?=
 =?us-ascii?Q?/BL4kkQmI1pTJus0ZOLOlcFk5jEcZEFPME/OJ0q2zDIABDIjh+7xEog//f9L?=
 =?us-ascii?Q?lHwTtF4Advg3UWPjikNRGsSH27fqy9XCBPM4pQCPrzpsUiX5Qr9FvTlf0xKS?=
 =?us-ascii?Q?f1q4u0mjBpF1RIbyBeLwukhcpKPPXNky8LWrfpnfOntSSi6DylmVO8133O0K?=
 =?us-ascii?Q?u8eloNPjjDq/i/WO2qoy6tGUcWtFNIBFCeqsXdPTX9OLKWJs3OMBIPaHPiXp?=
 =?us-ascii?Q?Ng62PQBP3zP8zUqkKwQ+P0xEIgWOQkcjDJ3m1ZdGiIgwr7e1zu9rVbYTsx+r?=
 =?us-ascii?Q?s0ULFJ2+Y+M0G628QTzi4gmWA1h2Gd1Wm0PYiIEVfAqNb7Ae52uQKal4tyi+?=
 =?us-ascii?Q?l/PXlZII7z61Q8lYVu4PcKy8ts+nljz4a8sRQndhdsBhcWfslcHujHuLmL6V?=
 =?us-ascii?Q?AyM/IAjOLHyVSr+R+9uwBF35MBOMm2Pi/2z5/tU/p87ssXWHNl0JtXeRmAW1?=
 =?us-ascii?Q?VbYRg19MaTDK1h6ibJijmUqwo0wrRsX0xtc5NB+xPo5ZaFpKXvLvj4jObYB6?=
 =?us-ascii?Q?Jt+np0ZAefKthsH0l+/PRR6XM3e4z7HUFQ23U4gFdokIJwSxQGb440ZKaoIT?=
 =?us-ascii?Q?FTln+QaciFzxClUOWqPzGf4I8JqeQQaFQ0W/ZecXAzYnwFMZsjPTH4Op88lt?=
 =?us-ascii?Q?51Gtq7CjIgvL2r7EtKxtbSeXedwA733P5CCpsAj7xEkbD44owBhEwA/Nbdww?=
 =?us-ascii?Q?wcoOQobncYJs1ATsuqiUg6T67Hb5mxFOE285sHm+C2g0J6Hoyv1s6mVGKrX3?=
 =?us-ascii?Q?t/DWxE8TkbKg12ccLceALWl9V3wcE0krJ8RjglwshgO+ARd6iaQNso6NbvRX?=
 =?us-ascii?Q?Ik4/Qnaad2kG5m4giQYNn1M7Jp4aoUWfxB4t3dgJ4l35EtuCiLeNHu24Emxt?=
 =?us-ascii?Q?0qzC+rvuZRCqPpFn1CBzCFVT5d1SpnjZq1GMATa3piqQPJ0HBC4lUwZXSdzX?=
 =?us-ascii?Q?DXWyr8LVcX0hyD4/ufZhFYnXgoukn3eERw75o34VRLCTcsjggKtWR/U4JjUE?=
 =?us-ascii?Q?bE0XvC7Wq4gQka3YcviCUkApCLIz5rEjqmS1D09EdafTIVjgnPKtPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x/voFkA1JoiluefqZm9zRydxLQHGQJyt0NT6Xv4HJwMCpboElsKL3QGN6umK?=
 =?us-ascii?Q?hEHatftEOC9vt66MhvydY3bKGu+SBn+trk4hnVqeeD4cBUKZyLKxo4c7bKbo?=
 =?us-ascii?Q?ntL7hrbFqbzuv/YAHMDf9uAaS13sLf+jqcMX3u9GeaMDgWUAFUD45bKOJ0vp?=
 =?us-ascii?Q?20GRzlgYmNeKGa9Y1TSRqrHM+0EUX9DEHGXAUEL/J5AGyqiW7RJK0Gk8rbq9?=
 =?us-ascii?Q?gbBz5WUJN2cYHN5ce5YCL5Bn5m8yaLXRzLAHBS1c0gAdgAnc05C8lZj/m9Ic?=
 =?us-ascii?Q?toW5doNw08bYZvQbmOq+3uCtT86u0jk5E5WFI/IVG8KiFMaRtAsmNWeKKBqU?=
 =?us-ascii?Q?gub3OXNgLjVTuV1+HbeZ1J7QNWi3Ppem5uTGTP0t7pvhnpqN0aVQOXkVE6gV?=
 =?us-ascii?Q?50VCzel32YDn6NWX3IIh3/z0HXD1ouzCX+FKsaagwrWgw33IowLDLrWOwrpz?=
 =?us-ascii?Q?4KYW4Oo+SaN4US+86dFN/TOXR7BYq3as5lysgQ7dvbRBdWrBTpZ6JVTUpIHa?=
 =?us-ascii?Q?gcZ5Q09J6QQBfAGHin5PebdbENrtpp1QKMESlf3YVX+9dQ1SQyqPv70ncUME?=
 =?us-ascii?Q?qUEBw1QvuNHljSGPjEsvdSvFRq8khpL0EgGvzU6f1t4nSJ8rGCQyKJnxe2hB?=
 =?us-ascii?Q?XJvmhoYIAIYvhOyC7Ai8oHYAKXoM2IjHCuvGkgDnipcLWUq+IykxLkl1sYin?=
 =?us-ascii?Q?8zT18vcCm26UfAWRNI7AmWuCAdm8Y44XjKnjEfEeu5qjg5wg0waUOXbCb/dt?=
 =?us-ascii?Q?vNZbglOLA8Ms7jrsdL8kO+2taQYQt3CvlbtThQLa/URVisH/Bz0BZR1jGVAq?=
 =?us-ascii?Q?ajUPJTg5tZ/CA4MxvbMbuPS6Vth+u04VEnzjD2bptdqzq7yYoECZ1MrdPAPz?=
 =?us-ascii?Q?RZMQJ2C/lEgCQs5ajHAzf0m/17ASAqxjNRjPge9XFHQ9ldZGEj3UmBJTjee3?=
 =?us-ascii?Q?D072b3MzmofklMQQy9vm0gT3LITN4jKQsPRU4yw3Uk8i098vrUxPgLlwBVYi?=
 =?us-ascii?Q?aNsAToxuCrNvDzaqkPNaq4SV34PIK/I9zv5f5ftB8K0UahMTdrwjmGdVeQ8R?=
 =?us-ascii?Q?kmkTkJSW9Y/KDRKH5GOp2Cnfj0XIx0jbsTyMcKbv7DUn3LmQxxW3NQlMoFug?=
 =?us-ascii?Q?EYO6WKB3PFwzPMCEDolIMFnDgaVtfRfZBTP4gCc7F6YzA6aKAz/tJlmC1jpx?=
 =?us-ascii?Q?YqOw0egKuF01l+U+EZ2JAOYkaOuxcUTalgfCcZHBLxAsXLtQ1A/3+MRqZGi5?=
 =?us-ascii?Q?ZLoEHIcdIdGzuBQhfjPMcTyKi0TZP+GO9v6PhRdLcl/F0KQDgAYgbbIWDjs8?=
 =?us-ascii?Q?6fXNbNDgRub5e2kw72840Nd9AvYR7obhzCHpN14NeIThXj4Hd347S9uhRfGf?=
 =?us-ascii?Q?v4bL5CUvmKCW76e3td1mo9DjUIFtGFYooiL7zdlhv1R4LPkflQk8SbpApcje?=
 =?us-ascii?Q?ul2EiKAj9m7YrWNWdRaDacQGXJJn+VKnDpMXR1ASIrhNEWK7oTQFizxD7UNP?=
 =?us-ascii?Q?IV+IsIIt+eUwFPr0wu6FfonQDYBa1wSJEIT2YI8n3gkPB30YWKqDd0A5hwwS?=
 =?us-ascii?Q?eylcIyd582X76Iv/dEfXWju1KyyzK9tpBiZhm9MF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dd07dc-1ff3-47a0-1a36-08dde004691b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:12:50.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlMgADE8AQuHBGIBve9U3OUDoMjYoUBVz7RbKjferVxh3vFRU37ildrieSGWraKluYF/xcyW9es4YPZtQKNxRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_091255_369038_44540478 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, Aug 20, 2025 at 02:34:46PM +0300, Jarkko Nikula wrote:
> DMA transfer faults on Intel hardware when the IOMMU is enabled and
> driver initialization will fail when attempting to do the first transfer:
>
> 	DMAR: DRHD: handling fault status reg 2
> 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
>  	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
>
> Reason for this is that the IOMMU setup is done for the physical devices
> only and not for the virtual I3C Controller device object.
>
> Therefore use the pointer to a physical device object with the DMA API.
>
> Due to a data corruption observation when the device DMA is IOMMU
> mapped, a properly sized receive bounce buffer is required if transfer
> length is not a multiple of DWORDs.
>
> Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 13 deletions(-)
...
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
