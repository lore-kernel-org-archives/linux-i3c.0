Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA6CA0EFA
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6T/LvlFbCBSMzRtAFVXSFjENQ+KWxLgSQbs1TZ4X78s=; b=tDAbo3XSJiMmGb
	QXe7B7kN1nHEJ8zDbq03JfZnGBXQsy3NTIrWemp3y+9jLGFiesKod+rfP3EPky2n7jBzOJYxkDHg3
	OvE74JDRIDB8JTLDYYOTdHTfGQ4xBAup04CUkGuvLJEhe/KSSWlE45fv6EpgK7nT0wvwmq7zXBTGp
	+xA0PLsVQCYGn6kBxJWBi+rBM9w7rOP52E/eldorq7OlSc1jqOQ+fzFzvXyeP76nSDZO/Ug76piEy
	Ikl/FpI/lAxUyJpt3YUmRZAzERe/ItMFOpfj/qelEXRzB5u6VJBj46G7RmRNW6BKWN+ud95xiO9DF
	VoOL3XJ8cCIeIp3/VezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaZ4-00000008kr7-1XPN;
	Mon, 25 Aug 2025 17:01:02 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZx4-00000008dxQ-2yA9
	for linux-i3c@lists.infradead.org;
	Mon, 25 Aug 2025 16:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsxWHyqO0qBw8qyacbW4DuOvTI8kfJUMD+EQ40nEF2bJF/yQY7QNXlGpjy+/YUu95WpkDrM5Z9HsElNb9QFowOfnQ14AXNYCSsLXL3pWti+/+r7BRAOJzeFn+xbGmu+QvZCwBikrBYO6pJB2kOjUhRTTVTCapFwzaGWZUY4CRSAER5c1Aqv1VBfm7oiH0yswPOXOd5lhGcgsE8Hrhe/UbfppxzwPIpA6Im/ZHFE7CoVGm2APw0MlWvcfNooh01Xd93fnG76xjIoiKyws24jRbhu4YWSoe1Jk1uTezu6O1SQ45Qeriq9PHVOPWuE1Uyi5N/jWEoh9nDl+6za6obB/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjElgrt9YaWCiBCCpR8GFs+cSqFaqZcNdZ5op31zY/E=;
 b=A2YM0dYatJHhEyuZVVRACH9zmGAc6ALMk507KYh9W1kFcTxsD4uzHrCWFWy4xUdrkDpWNztLlKdECVnw8iwuTKFjfz+k+SzqJKonlNpgQokj8trmK/ld32mfND+IAx6jrnSBDKG3sbeWE5lD9cC/XN2EOlHcM7mYsGJF/Q0rvL9jwS1Fm4FHlqUVIqeRP5Uk3eKcplJV9eeuf/714KICzMX9DU58PYtsuCZJVpWuSoPuB+196efLz0q5jTtAYUPeRllODnXuJ8lqzTyfq60ITupwL7dcgsa+s7Gk7R8qVD1BM0CbEhnU2nzmqoRe1L6unrl9N5BnSPBHyYfgdRIJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjElgrt9YaWCiBCCpR8GFs+cSqFaqZcNdZ5op31zY/E=;
 b=nJErfdvtgZwcgtJqCM2I6x3i6FOgXQuD7j4LVBS2J0B8aUT3k/drNUz0BLddUL5Sbm39pdU11P3Mma/jI45uOC0mH//SMSzR+8wonstIhaplm/h0KL97i6isUFrK8eam4GphifyJH6+fS/IpY7EZddJuYZB5yf5TwKXR+rlMK2tLgrnaj99lLFrv0sUhIFqrTj6IjL0e4YsquYKUeAGC2YVG+/Pn+qOR6gqciqw6XM+YAG8TnbSzbmGeaa+Kv25gvh71teXjDxUURSgb/m54/DP0w7uSbQfG9hN1cUqI7itlFoIRVIL4ytVe1dKgIhi0QdF0q42v0ecKmcg1baXGjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 16:21:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 16:21:41 +0000
Date: Mon, 25 Aug 2025 12:21:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 1/4] i3c: master: Add helpers for DMA mapping and
 bounce buffer handling
Message-ID: <aKyNj8DcaB4AkthG@lizhi-Precision-Tower-5810>
References: <20250822105630.2820009-1-jarkko.nikula@linux.intel.com>
 <20250822105630.2820009-2-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250822105630.2820009-2-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:74::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: a0596314-d59b-4ef2-97e7-08dde3f37990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mIWMl3cPRDmC0BUY2G25A0EkpjvGFzmYTy79zqKvH5jV5+BFOzlNFOKvjdwi?=
 =?us-ascii?Q?wwTF8fhBbiPGiBuVAGNbXfrhqvOv/LPE1knhO9ciuyhzqGDdXsfXnqARRP5l?=
 =?us-ascii?Q?giVpAxIlUaD3qOSUdH2Mc5GkRq29fGpaL+12Acd4EXYLvJJm3uks4iDXSt6G?=
 =?us-ascii?Q?YXDkyZgS8V17SbX5jvbjUQK9ZAWjTUvHQ/hf7pOLsyq4hkQpgbNXjaeLXuDX?=
 =?us-ascii?Q?ROzErahBlGsyhn5wEYHrDP88nStIAMvckF+Gt6jFM21VHj/TjgnMGNs2E0pL?=
 =?us-ascii?Q?A2HNCumPTZIeCN1R4PxAE40bBjTEq2/Glzx+1hgH6NPdAB5cLUR9DhkwnI68?=
 =?us-ascii?Q?jhQ8Z8uK43EUJJA9jmWvRpZvJUHRAiFp4hmgc7gPIkh+w2a6EytoLxy3Z6Mz?=
 =?us-ascii?Q?eq8i/PNnX8HYPVLTtOWIU5IPYX8w8DXgydamoIc9zn4i6t52Q7f1TN1/010H?=
 =?us-ascii?Q?tGh8l5HdoorpNhkIEG/JnZaxD+ARtULeLR9CD0nyK3TSp85pwPz3aplaG+8i?=
 =?us-ascii?Q?6zi7HDD3MErZXYTPayvHAiXW3PvWY84RYF7H55umBD2EHCZObqKgXzDp0T4K?=
 =?us-ascii?Q?emA4slepnERfhqLZ/5UdF30kfdCypVLylDN/F2FDGaNJqWHuyttX4jvXFGWQ?=
 =?us-ascii?Q?KPc6GEbdEyojGT68TJ1uQwft/dz28P5yTEaQeh+Xe/M6NjKKp002MrMfNDLk?=
 =?us-ascii?Q?p8nCSpeVadRDQ1pyZMpsaRJ8V13rqw5Q6dKXENcbfglFFVLnJpgE8gxwO+9B?=
 =?us-ascii?Q?hQlAUi/YCdruuL/CMwyAxJza86qEDOJzuw+tQz+sE/q7HOlVa36TwT6i1oLn?=
 =?us-ascii?Q?N4NfRGYWHvb0Lvm8qTr4+zLXHU96Piy1niEykmMMJJnCCeLGox0JGSfkbHJf?=
 =?us-ascii?Q?tn6BfrThnQyQz8jspaBb+JmPS8dbX3ohkVbjKonVak3DTx+/bt5BwCghqsjy?=
 =?us-ascii?Q?ZuDp4J44ciDkLeaPZQRf+njEEfWtbLF25Mz6wRFT1vBVKSe4b+U3b44CtbbE?=
 =?us-ascii?Q?4uP+ZJbqCvRMBzluL9ipjIuzB2qQKWnTDX+LTANtgHjbwwP9atrA/TdYkqMC?=
 =?us-ascii?Q?zA073h4+990oYLwqHfurh3yKYjorGryqH+ZB59qZkb49uaoXm36K+wm0RoqV?=
 =?us-ascii?Q?4otgVZdRZTrgJIHDJK4dviS1s0bCtukezGPCzx+kz1doUuC36JIyv4xMaQUV?=
 =?us-ascii?Q?k6aLoaRjUVKj9JNrqFRGkzxhqPbEn2FJHXY6Sc6K3mf9gGbCVnzLwzY3cVEn?=
 =?us-ascii?Q?1B4nXece9/aKYlKNyd31LTpb9qAhhIL2kUR/STSrChY43u/pX38bW0JCQV9Q?=
 =?us-ascii?Q?BD7Ydl06z265PfQscfIO9Esutg8FXVTTD3jgDuPsSX9bs8AzPEYCiMMC783O?=
 =?us-ascii?Q?3gT8rLPPnigClNi8xfNJGqn8HDf+f8ju/sfMjaR1AoZ///ULwzrYTfMKbHlT?=
 =?us-ascii?Q?5zz9OCMxxAawmj8ouqCQk+jbJL+5v2xn/oe+RukjbyDv1CvhjbTtNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHP6kQWzCun36aAJgYK1/K9PFYM2puyV4mBySAEfnwLDll04X8twsE99bYrz?=
 =?us-ascii?Q?PUPtg1Xp2i+jMDnDMBjd9H3vYUALka+8/275XWC7co1UXiMZS8e3z8oKfiD0?=
 =?us-ascii?Q?U6//GTWfo6PJtv8oYeRe7lMnbPHiG69/D3eTsw/eZn5waszVEh7P5+FPt/sg?=
 =?us-ascii?Q?AX5ZbK/RCywyVASvk02Q9NHPweSy3io6cG3z5tOesocX8YK1T4Z1i0ai3mbG?=
 =?us-ascii?Q?/wfQtR4QYymeZmmJckGfB9dkDnk5AvulMSMjOtt576kila3k6GK/+RsqC3XK?=
 =?us-ascii?Q?OFlODTwEpGbhrIDoBZKHogVBoipXQpv8VoFE1xHhJICYOvQIRF5UaWIbnnyM?=
 =?us-ascii?Q?3N4QYt9j9zJw8KactGMsCa7OrW0U7qkj8wNOvVYy7KsEwNzLMHQM+BwpjxB3?=
 =?us-ascii?Q?lCkml8OEy2Cw8u5uW0moidJwnt7PNrKWpH/ONFgFlD2Ka1SBDGUZOtkFmxuh?=
 =?us-ascii?Q?V9b3Ek2N3v8EPAAPHZ9c+BPwUZKzbERRbWfDuakvsHLtwoSAbAWWQTGufUFF?=
 =?us-ascii?Q?oBFBvgg98M580/sA7bfAtQCHaOYuvFgLXxbfKRBvkhE3GwMJ9Y8reBghZEn5?=
 =?us-ascii?Q?C0+43MY/RhoQqyGcFmewQAazsP4QI9Gs+TPyzMln+mADMW3TpwyLhLJYY7OO?=
 =?us-ascii?Q?SG0oBmSruUUF349VslLfHPxj1ggg6pPD4cPDEyPd7f+mhtXLqk9I6opoDY3V?=
 =?us-ascii?Q?0txTYT13F7AOrRlMPLfMkxxJ9yBSg72h/xA9PhgN7ydTFO5hQSDSTxWwvjgb?=
 =?us-ascii?Q?T4/w5/JUugmoe+Y3syDNpvQDguOdntZClgWw3E+jpf+dnlryh7AjdreLGtVi?=
 =?us-ascii?Q?wMaU3pCvKrOBXvbuBawJAH+WNvOhl/wmNa7igVt1GFYHs5C8euOgnQASZCnB?=
 =?us-ascii?Q?Do+PyOwZ/isHOruMxzkSFCimC5eOmj1ER7h0ZOA9EnpwZu/IDj0/4l39U+R/?=
 =?us-ascii?Q?iOKdNEN8pMNnL1XDuxiJrf3+rLxuSSCTKMKbvcVfdrpPsY0DK1Y6ZHS51mGT?=
 =?us-ascii?Q?OmqSUJGzveF1VcXPHc/j3QRdk6bgPy5H4XSzwcjaPfXSEjyrEKRUTUDN5gwS?=
 =?us-ascii?Q?lRrpo8R8OCba4H6YOHxzHecUd/EMt7NW0kgIECyIAf8rV475Os2r01b9pnZi?=
 =?us-ascii?Q?+Tnl46wrxkYWN1ndrKQchvRZXNpOKWu1s5xbDzYf2gZ9Ogmo2g7tjzlDh9I2?=
 =?us-ascii?Q?LWr8OdJ6rIcPWkT5mzwssjBnylYvEpYGl6sVR9xH47ybZqK6X4LPz6PJ4wnQ?=
 =?us-ascii?Q?KG5F0Tr9Ew8Rh0IlXLqJpTDpONYLHTYLxWJoj6Na595LGmZvsLmjFDRpWPOT?=
 =?us-ascii?Q?jT4lzhi6ztOoHQIkriB13ja1HjcfIdbeab2Fl0x5Y4K+9dkSXLIFJZASBXzk?=
 =?us-ascii?Q?NhfGBq2n0bGW8UfB0fpj4C31RoS7gSFW6WbA9CgSLaVvcbVciI2Fd4Ld+qhL?=
 =?us-ascii?Q?q2HdMTg7Nn35qX0DGJCCriSzCZNbvTDT/Knnwa/2zKo7iiJWMPYBdUStaQEC?=
 =?us-ascii?Q?502qsjE/MCSNP78CUohy6SZvMl3lUNj1UKix12SsnC5x3s5dlkZMu1TDUs1O?=
 =?us-ascii?Q?ieiDQdj1HMd8P+q2hCBOU0HRF67BuqJUBbTn2GWU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0596314-d59b-4ef2-97e7-08dde3f37990
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:21:41.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY8jxzuXZ/Hpf+H8Nv75zQsO4GXNFJlo9UXVAZVq9H+VtQJJpfcB9lUQk1S/ShzbaaqFBNAv6Zvnt8xzQ4XPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092146_923697_48BC2687 
X-CRM114-Status: GOOD (  27.24  )
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

On Fri, Aug 22, 2025 at 01:56:27PM +0300, Jarkko Nikula wrote:
> Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
> with stale data from the RX FIFO in DMA transfers if the receive length
> is not DWORD aligned and when the device DMA is IOMMU mapped.
>
> In such a case, a properly sized bounce buffer is required in order to
> avoid possible data corruption. In a review discussion, proposal was to
> have a common helpers in I3C core for DMA mapping and bounce buffer
> handling.
>
> Drivers may use the helper i3c_master_dma_map_single() to map a buffer
> for a DMA transfer. It internally allocates a bounce buffer if buffer is
> not DMA'able or when the driver requires it for a transfer.
>
> Helper i3c_master_dma_unmap_single() does the needed cleanups and
> data copying from the bounce buffer.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master.c       | 74 ++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/master.h | 26 ++++++++++++++
>  2 files changed, 100 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2ef898a8fd80..033d06cabca2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -8,6 +8,7 @@
>  #include <linux/atomic.h>
>  #include <linux/bug.h>
>  #include <linux/device.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> @@ -1727,6 +1728,79 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> +/**
> + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
> + * @dev: device object of a device doing DMA
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @force_bounce: true, force to use a bounce buffer,
> + *                false, function will auto check is a bounce buffer required
> + * @dir: DMA direction
> + *
> + * Map buffer for a DMA transfer and allocate a bounce buffer if required.
> + *
> + * Return: I3C DMA transfer descriptor or NULL in case of error.
> + */
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
> +	size_t len, bool force_bounce, enum dma_data_direction dir)
> +{
> +	struct i3c_dma *dma_xfer __free(kfree) = NULL;
> +	void *bounce __free(kfree) = NULL;
> +	void *dma_buf = buf;
> +
> +	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
> +	if (!dma_xfer)
> +		return NULL;
> +
> +	dma_xfer->dev = dev;
> +	dma_xfer->buf = buf;
> +	dma_xfer->dir = dir;
> +	dma_xfer->len = len;
> +	dma_xfer->map_len = len;
> +
> +	if (is_vmalloc_addr(buf))
> +		force_bounce = true;
> +
> +	if (force_bounce) {
> +		dma_xfer->map_len = ALIGN(len, cache_line_size());
> +		if (dir == DMA_FROM_DEVICE)
> +			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
> +		else
> +			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
> +		if (!bounce)
> +			return NULL;
> +		dma_buf = bounce;
> +	}
> +
> +	dma_xfer->addr = dma_map_single(dev, dma_buf, dma_xfer->map_len, dir);
> +	if (dma_mapping_error(dev, dma_xfer->addr))
> +		return NULL;
> +
> +	dma_xfer->bounce_buf = no_free_ptr(bounce);
> +	return no_free_ptr(dma_xfer);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
> +
> +/**
> + * i3c_master_dma_unmap_single() - Unmap buffer after DMA
> + * @dma_xfer: DMA transfer and mapping descriptor
> + *
> + * Unmap buffer and cleanup DMA transfer descriptor.
> + */
> +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer)
> +{
> +	dma_unmap_single(dma_xfer->dev, dma_xfer->addr,
> +			 dma_xfer->map_len, dma_xfer->dir);
> +	if (dma_xfer->bounce_buf) {
> +		if (dma_xfer->dir == DMA_FROM_DEVICE)
> +			memcpy(dma_xfer->buf, dma_xfer->bounce_buf,
> +			       dma_xfer->len);
> +		kfree(dma_xfer->bounce_buf);
> +	}
> +	kfree(dma_xfer);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_dma_unmap_single);
> +
>  /**
>   * i3c_master_set_info() - set master device information
>   * @master: master used to send frames on the bus
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 043f5c7ff398..c52a82dd79a6 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -558,6 +558,26 @@ struct i3c_master_controller {
>  #define i3c_bus_for_each_i3cdev(bus, dev)				\
>  	list_for_each_entry(dev, &(bus)->devs.i3c, common.node)
>
> +/**
> + * struct i3c_dma - DMA transfer and mapping descriptor
> + * @dev: device object of a device doing DMA
> + * @buf: destination/source buffer for DMA
> + * @len: length of transfer
> + * @map_len: length of DMA mapping
> + * @addr: mapped DMA address for a Host Controller Driver
> + * @dir: DMA direction
> + * @bounce_buf: an allocated bounce buffer if transfer needs it or NULL
> + */
> +struct i3c_dma {
> +	struct device *dev;
> +	void *buf;
> +	size_t len;
> +	size_t map_len;
> +	dma_addr_t addr;
> +	enum dma_data_direction dir;
> +	void *bounce_buf;
> +};
> +
>  int i3c_master_do_i2c_xfers(struct i3c_master_controller *master,
>  			    const struct i2c_msg *xfers,
>  			    int nxfers);
> @@ -575,6 +595,12 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
> +					  size_t len, bool force_bounce,
> +					  enum dma_data_direction dir);
> +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer);
> +DEFINE_FREE(i3c_master_dma_unmap_single, void *,
> +	    if (_T) i3c_master_dma_unmap_single(_T))
>
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
> --
> 2.47.2
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
