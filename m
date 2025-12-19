Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C350E66880
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NBTkwqBp3lBbhYcjhuzAhe7VPPAbv6y4GQj+BNTvNs=; b=XX47U+JKKUBvlZ
	aCdCjZzfA1KBsvJZOT+dCPqw4z14wY+6IdNtOO0V8So2raLPPWuiBV/FDIs2kXW2v0EYJDRZNEHRt
	h4Cr6WvznASxZ9NyhYkBik4CLbLSCiMeLzNUlKZidVI7F9QnMIz/gW1v5/1ccbj9I0mZLROF1T/lU
	pZi+WS2/Ur1cRm2EtQGmiLHf+glL95imSgyVNtJa95n1+Bv41EQUewSNeRhLLpe33iNAgIar8EOzT
	UIE3lHk4Z3APfza9GMJNuTCd/D9WtZLWW6Hm/yvaqkZWF4dk5Lo9t/BcibQdrJ1ZzUdEDrIeaISSr
	o1GAmGN1ndZbHiWFUZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeAp-0000000Ai1j-3EXZ;
	Fri, 19 Dec 2025 17:21:51 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWeAm-0000000Ai1L-3YeQ
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 17:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+AM43IjLpBYlTqwhqvAnQhtOqhI5/TL8JqrsSpjRleUYFzMQADOmmApEI6dLbtS8CXPAYXfEEK2h5GDaJjDff6TZh84xFQtST/zThZmYuhL3tXIQk16r8OCmLhBIs7w0s1PTgceUveIuxFJNw+tUYO7UqGaqOACC2dW0sAMoD1yn1q/goH+HJTEGuvYNR/IsOOBonztp+AVvcypz7O70WD1hf7FIfwOQyKHvBEoJzlT3FeQAGLCscqdOxi5o1buI4rNbRmfneH9ZIqaMQW8I0/tPgRjvGB4sdfL5c5JFCFRXaks7K3GrVD0qJU5xxbn4I08qph0Lh/oZ++3CIvNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCNI5npwXoCr30b7eumsu8AqX7kFwrdCS7vUTZUeLOw=;
 b=eF9qBDnmgAzP4XDqv9hmALTfXRXiAa0feFgDNj+u0UAwRjWLq3+jz6B/sWroRo/XcTxGleBM+YxufZdvcUW4lBAKDs4c1+6sDy4fASgnRXGdleZuz6E1TcivhwRlZsqzzdDQr6EBOC2yAJ0d7FkHDnlcebrY/68mHJd6j8i3ojBj+jpVTUoXEUT5OvG9O4Lo4o/B1UlQ+MHx9Z9IzgYdrFcXzGyerdkQT2E30VUjsbHzrXWjqhKcGAB+slL0c82+vMbJ5y1bCL/m4IwZCoCxC4jbOUAh8OMEC5T8ybV1hOKutgbTEaO8SW2S+HQbqxi0IQ+8Zw6J6sBwIV+ztFvV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCNI5npwXoCr30b7eumsu8AqX7kFwrdCS7vUTZUeLOw=;
 b=a9Qf8RlAwBWFoARvhP7C5j+qPWjo6X23TIr3bqc1z9XTCU8/8eWTXmbAsagSu4uXFSzMZ6YR7yQF1EUBmhuwfEOjYO+nV4yUM8OPOQGJzQfXpr+Jm2AMpH7QmDdpLMA2bgZzrjNDsCzuGuh6H9CpqlPpvSP7pN3vcrG58ZZTpDwSIHNcY/Y3Pwc4t4CcDwYLvyo14Os4Jh1J0smfMmBaCE3qA7bZj8bgztJv7OKtt0NturerY8EH78oU10tsZcmJiai0Ak477kuuTdwZmasVDaiL+wEhniN+EHrZ04nfLEqpVzODD8VLxncNCP4K8cwCHs/bSibr5BqDA6sL/QokQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 17:21:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:21:43 +0000
Date: Fri, 19 Dec 2025 12:21:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 17/17] i3c: mipi-i3c-hci-pci: Add Runtime PM support
Message-ID: <aUWJoYXYLmkuDyd8@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-18-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-18-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 386df046-72bd-4421-2105-08de3f2314c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?km16qk6fFpxvk/qFkEhEnld75XloUXHgYADYGLtYz2sQDWR84N1ZeOHCOPCP?=
 =?us-ascii?Q?Axls02WJ5hokn6tjRp3sIGR99QrOIS3osY4PTJl3vyDVtwiK/19+x8V0Dk3z?=
 =?us-ascii?Q?Bnga4yWKDpoj2CcQgxquIgsyfmSnBW8X/wVygAUe8LIwouMrsG6PVuhSmpkf?=
 =?us-ascii?Q?JQm0ng4MfNy4hLwO+Gs3kaAq/Cgxb2Z2UBoFkz+pQRPDfv9H7bPWLRQCdshZ?=
 =?us-ascii?Q?XOfK3qsp6CgNIryc453KePztSr5IDsPmhcDLzbLyZk4yGYq3e5DJe+1ZDXHo?=
 =?us-ascii?Q?liWN4q3f0P+VP2I+1HQYeeYj1NrubbUl8MEKy3nn7VgNBQi1FyXsI75f7i/7?=
 =?us-ascii?Q?7Z9aiuVQUcgEbz7RS03Nj2RdYa/9anbQCZPyCOha9ixgrOLgEmWkFR/A4PEu?=
 =?us-ascii?Q?dtFZUD/1ZrewQGh4e3ODXUUr6TXXQPxa4s/dSvN8zsXvqYg6LxuUKOkeSpVO?=
 =?us-ascii?Q?6UnVI1l0jXoxTE+xgjKTTtXNeyBQDPEjUnMyrLKpBWNHktph8g/eR7ByWdve?=
 =?us-ascii?Q?sZtqczcya1C8JwUyjwIFfMmm4T/abREY5ljFREHCBWqZ3JhQ+quteaBTMiev?=
 =?us-ascii?Q?Gew9hkn8UHx909Uhr3CL/ByAwRbB2Sqfxd5C7kGt4RFGVAtd78TuVppNDUZD?=
 =?us-ascii?Q?r/jNJ1iWPgw82NNXlW9jkvch7zrDKgnuviu1DBZkBAYA5K5NM6iPSki11YRf?=
 =?us-ascii?Q?VL747n74kt7Y6SAxw4/gTpi+xI0Gtk2bWEFv11TLm52KkSAk92K6AVBj/R+d?=
 =?us-ascii?Q?tjOA+5Yz5mmsMHbHcIbgfeaO+qnkzy9wbGNxRGY7tK3SmUV1vyMYpMAAcfkY?=
 =?us-ascii?Q?o4FawsdezP7qa6/1doMXZK1+UsLvKiU9RkRc4l9+TPsEW6Sz9M9Umw/OZbWr?=
 =?us-ascii?Q?K4mfKc9ByuwPWSmyKjxRvdn/Y1o+LQYuJMRxKoKoVLmPqOYG3tfPj++/ivuR?=
 =?us-ascii?Q?3oMT7Bl4RfquGwKJ510RGYbGVNYtbEzEEe+bWS2292tYWSPLqcVfhJlHzNG9?=
 =?us-ascii?Q?pjyHeaOC0zVOPRItZZysN26yfQIRVkHmmy1Lkrh92yYe72QsTXA41notTW5p?=
 =?us-ascii?Q?j5ekdQt1jFVwlpKMJfh5GzBUh/ZxkiXgTla0oOJ2Lbj863xj5oD6JdEnzWxX?=
 =?us-ascii?Q?BRWftXoear93IRqeKreBMku+WogrSQByYDKzhoX4I6ePxMN2jPoV9GkxgzCO?=
 =?us-ascii?Q?Y7b0kVPu0SVfyy8DS8PTH7PbOQvRVeesxtojQ1pXNMXKlqe0BEERtv//1Ax2?=
 =?us-ascii?Q?AT0meJloeFOeeDljUC33yx3+z7GYnKn0mQzxPTiM6pfI/nVlqb/wEzWXeQH6?=
 =?us-ascii?Q?z8+MA/Lmf9Ew4w/vayenoBAm24Qx4HPrymA1wLMXS37HRCE+iU3iqd8WxivU?=
 =?us-ascii?Q?MsqvpduiMjD5kxPWvKIsFP3/fdYVIBnZ7mMDTQTgJVeU/ZW3OQQiLsYPoz7U?=
 =?us-ascii?Q?fYtWZdM3HZc6GRX0RRDkLpjGQaryo8CFbvgeGq7zlhgyyslQS1HOz2b6/U7G?=
 =?us-ascii?Q?WVStUQV0kH0icuI7vbBS5qjK4AD2xd/x161G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XFO7xdB/vgQuow/A0k6l/f84j6xAkaWCceAsmU6mIvMdQ+/oAeTTKs1P93PT?=
 =?us-ascii?Q?33qqbEJrCnemQa+a6dDXFJd6YsnLFFNTQqkRik2WxFzkr1mw0KulJLhmugdY?=
 =?us-ascii?Q?KBUFIJBlFVB2RCcgjiO4mk3W3LqFZDgySLS8uS46l4b1/8Srqf9aTJpN8A+e?=
 =?us-ascii?Q?auq5ALvTuLu/iSypYKLdFYogNpyPOvaExWUQ1wd7jidWvzE1FsEpG0/2XPmr?=
 =?us-ascii?Q?vVtiDatuVhRJkHCbTxUQTAiBGrhSAlJZ/31CuG+sxgAe6lKEoh8s93iS2Mwi?=
 =?us-ascii?Q?tO2Ujhc5zVHlaDm6uw68A2sqPgDhRwcKxXhwnna5QQhI0+OJ/hleNuRZyiS4?=
 =?us-ascii?Q?7mIHlPNFGLyhCn6LFiwk9chZeO/U/xGaTsK4SVwRJkrl7AQQmWLZpDeoH78C?=
 =?us-ascii?Q?f8jdphNNeD2z8O90WkCVU/AP1WJjgwHq3PkKlnu/j2dcTwlCmXWz2iSvMHO6?=
 =?us-ascii?Q?kaCr3V4CJMkbebsjI6wBtSoo148h/82xVkkYJqXtow2bZHG1VXEOZKcrpj9/?=
 =?us-ascii?Q?0+sy/XA7KqklzUDF7qKhu0v5tTWiOG8mb4BYsVUaIjGearmLF4bJsydUmiNn?=
 =?us-ascii?Q?JyK7nvGutWoclBPb41exm20SEps0SgDV9xJZruL1x+gl8jh9oiIvzFcjVyVc?=
 =?us-ascii?Q?hjqMcSSCCKSh/LLPP8mo9qNRxduTOVij5ENAygXtjg6zz/aAVq4siVJUYh9n?=
 =?us-ascii?Q?10JsdOrFpiFrea4vwfYibRHy0JLCBRsEPZOB2NKdQ3eArRDE9yj6Q8BfsePZ?=
 =?us-ascii?Q?XOhDD1H0MNMyk5BEcp21Sh1FaqhWPZnvmZlPXJ6dwYpa5Uyt6JCkVAW9eMvI?=
 =?us-ascii?Q?PoHBT/8a9JkMcmtNqZEqFdz1Z1TBrLoGa1k7xnXv8fox6ZkLd8HkZTb0EBfb?=
 =?us-ascii?Q?RX6BhJRg4rs90y8Jf+4CrcTDKai6pYkhlxEac84CM88qCRkIfAIER7gXz+tV?=
 =?us-ascii?Q?W6siyF4R4gnLQnpc8nh6vpA1RaHwzEE7NbQ86i+6ZFERnb/0dXbj2uFyaM0q?=
 =?us-ascii?Q?IWk2urS25h/OIbHwkGTb/t70kStMXCMq6RQI36KW6eKdCEfpACXPNPw/sikw?=
 =?us-ascii?Q?oQaBPzbcKDJsEEPmtd3EEZWW2UlVQHYXo9z41ZPjGggVSUJFD1nuUtsXvvbU?=
 =?us-ascii?Q?+LWmnAiscDcay3w5wsFXU0Q86UAOfrCsHVPThpUEcL55YGkiW8kWR3g7rI3B?=
 =?us-ascii?Q?juUcaxm1iHooQ1rlNdN/a+Eoi6kR28BiuGqJDPtc3UM0BZtDzFrNe/IPWahl?=
 =?us-ascii?Q?MXPXD7HxejQzy/8JrzLICdKcVvqR9J04Y0vGPbYcHKV1dAVtfHOIUykFn8gY?=
 =?us-ascii?Q?WNM3GdYfK4D62Mt5D9EjclrKGI3VST062XXlvG2GkRlUnb+Xss1t6cEq4Wus?=
 =?us-ascii?Q?V0eQwz1ilTiggQgluw+xmGRmdnwR1M+yRbf5UJ4shp3oRPJ7Bq6QEMIpALIl?=
 =?us-ascii?Q?noPyei+XQQNQ/AwnPn41PhfAFnvL+maFvk9yWeWpm2xoaM4WQXFnYNwYX7H8?=
 =?us-ascii?Q?O+/R6IJY0uhFVO0+tzBbHvhOtYDv+MDcv1o3elgb++Y9+c+O123Ksdy+OpVI?=
 =?us-ascii?Q?Br+Xm+hQNfyY7MkNPZUksI1DgITe246iVP6Wkyvw9lHwuWmornwYNiC7zDFd?=
 =?us-ascii?Q?ENGxeKjFVTaH8kj4a/ZiMct7abZmU35G93+BRQt0fpb3okmDvfjqwcElgnq2?=
 =?us-ascii?Q?9uU3xGXigLq9D4kO4dMBc6+O1JyPaxI/5WEfCnGr/ga/9hlg2OlCMBQfP/R+?=
 =?us-ascii?Q?hLHh543KqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386df046-72bd-4421-2105-08de3f2314c1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:21:43.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvtPzREKLdVXrTymeSloXRjSTk/GZJsqeo9XGnPr/ZtGtDN2QJX8TwN4HW1u2fmmqJ7RvTIvwtX6jyby+DFiAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_092148_889835_1865FA41 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, Dec 19, 2025 at 04:45:34PM +0200, Adrian Hunter wrote:
> Enable Runtime PM for the mipi_i3c_hci_pci driver. Introduce helpers to
> allow and forbid Runtime PM during probe and remove, using pm_runtime APIs.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c  | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 458f871a2e61..1b38771667e5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
> +#include <linux/pm_runtime.h>
>
>  /*
>   * There can up to 15 instances, but implementations have at most 2 at this
> @@ -208,6 +209,18 @@ static const struct mipi_i3c_hci_pci_info intel_si_2_info = {
>  	.instance_count = 1,
>  };
>
> +static void mipi_i3c_hci_pci_rpm_allow(struct device *dev)
> +{
> +	pm_runtime_put(dev);
> +	pm_runtime_allow(dev);

why not pm_runtime_enable() but you use pm_runtime_allow()?

Frank

> +}
> +
> +static void mipi_i3c_hci_pci_rpm_forbid(struct device *dev)
> +{
> +	pm_runtime_forbid(dev);
> +	pm_runtime_get_sync(dev);
> +}
> +
>  struct mipi_i3c_hci_pci_cell_data {
>  	struct mipi_i3c_hci_platform_data pdata;
>  	struct resource res;
> @@ -285,6 +298,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_drvdata(pci, hci);
>
> +	mipi_i3c_hci_pci_rpm_allow(&pci->dev);
> +
>  	return 0;
>
>  err_exit:
> @@ -300,6 +315,8 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
>
> +	mipi_i3c_hci_pci_rpm_forbid(&pci->dev);
> +
>  	mfd_remove_devices(&pci->dev);
>  }
>
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
