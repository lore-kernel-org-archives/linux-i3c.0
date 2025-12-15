Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D38D5B85B
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6x3e/VJ/OdIiGuHuq6oTxndb25SLy2fmzTsQwIYytA=; b=LH5QtfkQAEd9IC
	h5pW5bnANYdbW5dWSpjEutaO/sCSr7U3ZQMLVfdiSN8h0DfvgnzwPHi8bipHddUXPe0e0BjSUfHTh
	Ymg/1mGULuVsGj6ls9ClL8RgEDiF71cNE8RZQ+uDFR+04u9nGPamYiWZKKy7nDOpgoQZkpXkucuiY
	PXuWLnxfwfhLv/cgwaBcF81jAITmDaedEI/leaFV8JKJN9OYhLEVTgDwTZ+fOkSFiLCp1v3pGfJlI
	Qt26VNleE92OEJc3Wqw8G71MaBtZAa58L/FwGy/DczKdd5MfQ8EFW1K9hE5wwy5tTdhEvdggjIEQL
	5GRLrSKi+WgZATZ0tl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCjc-000000045ej-3Qn7;
	Mon, 15 Dec 2025 17:51:48 +0000
Received: from mail-norwayeastazon11013030.outbound.protection.outlook.com ([40.107.159.30] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCjZ-000000045dx-2PI9
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 17:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APeLcxMcNCYFwCrehJJKZ0CfxTRFgBKA2vZCiFbA4f7KKunkADPonXvss2l4q0h9tcKGWD4CqFjduf84wuFJ7IXGr9eaN8VkCENkcp39Gtulp9DqyEstE1Kfq8MBn5Eciv6A9p3SNYyAOoMwHt8lVQbnpjG76p5bO7tIkNNVQT5xVMenj8QRaaWXBnaUsBebo0FiSuS/TaArCDzVB68YwI/4OtibUuYTgMOCCyILJWFLuNYSR9+xr+bZJdghUWqaugIvf4/lvqAhqfhHFBVRl6sFzjstKW6ZiKFQiGCNzN5vf6RbqmVdRkNThOaO0kjZJPYwA/Tw3vMZpMkWbMEGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrhyzez5vGXmlLDPA9srrj2moe56mH5fIQF8tuoKpBc=;
 b=DubgZjxhbWsG5J2qcIDKP9B6+wNuCPSYuFgJEnZVgVrI1twLaB28wV5HJ4qyD9QauxcXal7XTiVd2I3+u9WooblEXE9Mv+Bng6njZucDD3xTOHlZ52TnM6BRqWhsxsAroX29blSgqkArxLgTf3ajK9xk23YgkmstrDp6BE6vK73lY4nLHtfGNNqJyvHSqVPNKLq0Uu8xfmCfehpVzH1uNR32JUYaiSzmK9fSZhZK3hFVGQV+yTBcAKN5eNOBv87F7YIzoLIxDEJvbxOME+MHkRumfffpqzvWLPpaQQvArrdVFzTsfDqu19BYWUlY6V1ZKXVXMB6mmEQjaaG+qhyvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrhyzez5vGXmlLDPA9srrj2moe56mH5fIQF8tuoKpBc=;
 b=Wv9f0ZcpulnieXYAZiCCqmG35RHfTfEjCThmm/RkZv9cECD0Db5+vN3xNFE4tQuWqsxBo9XWbkiZSJTwWUZ8nL/6hiBcqs0RmhOo3/90lVYpEZ5sDK5SHFNHR5u9TL2Hd069mI9DYIbCu24Tx/6Dj5Zen/UVlhz6n4MIWZzh75ilxd8avx9cQDhGh+ttzSZgjHMMr3cDeE3xzIP0eXK1uKEsYQJ9UpC//7MuA1V2LH5CGXLn3w4vkI/hzWZMPFLSpRtwBxUf+rsHIUYHB4k8IjqQtIAigNHTTRyAOZzEA0V/entbk6wrTArv2Crbiu5QKU5c0PNTI7fMbeGwXycu3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:51:40 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:51:40 +0000
Date: Mon, 15 Dec 2025 12:51:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for
 Multi-Bus Instances
Message-ID: <aUBKp/vAPFQvxeqV@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-10-adrian.hunter@intel.com>
 <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
 <a2f817dd-99ae-4631-8879-8c2f9bc2d6cb@intel.com>
 <aTxU9AgDyi43zDyq@lizhi-Precision-Tower-5810>
 <7e173df5-bbe8-4fd8-ac32-e8f29deecf0b@intel.com>
Content-Disposition: inline
In-Reply-To: <7e173df5-bbe8-4fd8-ac32-e8f29deecf0b@intel.com>
X-ClientProxiedBy: PH8P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::16) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b76a69d-4ba6-4631-fdce-08de3c0299fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|52116014|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/b2h+TwLqZRGmyndoxfUjXa6UdKaQEWLaXt0A+5MUiaQyEXJsqYP/AxP7qEL?=
 =?us-ascii?Q?uhMlmTVC66WYDpoA/YqTdA1qOjdhPFUvBsr7MG7QjV+s6HHcrp/Q0rH4W7lt?=
 =?us-ascii?Q?7wW9aNzbgVWXVDcbVjLKMRilV7TOl08r/bFe5a0Ggzob3ZpKz5YtZq7WY4pt?=
 =?us-ascii?Q?NLJ7wtY5xpuMrwKrrUGP4qheHqJYVl6T++ceGpdCynmb1ZWLbC/LZE8dO2JT?=
 =?us-ascii?Q?YAifzHM1NXDdZkze+X9o9KME1SvDidAKc1I3YQrIrgGVHvjF3binvAACQP03?=
 =?us-ascii?Q?4GGN31d9gpDB91rWE++meCLfY6yX40cYD+n3rQu9p1QEHPVXVLGWybnBhVsB?=
 =?us-ascii?Q?jQzhyrQsJTLeimkWKNvWzvotOSFh+1bXqDzMkOieF+/8L+ou98FYy1lZ5tYa?=
 =?us-ascii?Q?O6wDjGRou9cmEJ8zm9jlHVZ/1L/ObCjGYPcNF/zxY6bAUSJmJFGhkpxYX/EL?=
 =?us-ascii?Q?M2N5LgPn2OJZyA3VqsevkDlPzeAQOxUlj1uZ0QIpEcKUDGa6l5q8kldpZcJj?=
 =?us-ascii?Q?4yM9HV5gHfmrIhhGWZAVFMArBXdVfBeKZCYGA9FQKysDTBZgnFMzlnLaHfNT?=
 =?us-ascii?Q?hMvro1Zuk4ojbel1rFqsUxGqPIysjMyxE8y1mLp5HsYWYa4/3806xP7VS4wf?=
 =?us-ascii?Q?qXioPN2H1SI0xpkhUZHjgEa3GI8qsGj+GFFrk843KY8aN4M5L2blKYSePfb0?=
 =?us-ascii?Q?4i7RfsNT7mYUcJ4hw0YF/ivnqxJm7Vej+zPbfTSED9hM9CUN4BtYImv4+JIy?=
 =?us-ascii?Q?e1a0JpzloR/fk0R4zvAMx7DMrbr25YIqwIUAz7wpDj+9UOc1685LoSwaGoDH?=
 =?us-ascii?Q?lYpWcz6Thv1PAIv6+8hrmbl5BB5dKBCTm6x/7OKEmI87LELwh1AfvuAZ96KC?=
 =?us-ascii?Q?rgl/PeCXkTCXlGXJ0DegYhefIN5q2s69FZsw1hV96oA3/4ItfG9HnYS6+weX?=
 =?us-ascii?Q?AvdyQ28O2sNBG36vxtsuzqqufXUmlxv2iWhOo+t/BfjrMQOM3Vvs0H2v0vjL?=
 =?us-ascii?Q?AKowu6I6CDLoxDMzVkz2Pl01YM4haB6WEJmQ1E6SGewApjWKrtsYTohF80uf?=
 =?us-ascii?Q?dft0J2SG3s/FyySs8WB9Q7Hkm4fT8JyOAxC2WfjDjFnUhQLaaGsVhGHHB3Qf?=
 =?us-ascii?Q?AseIyejLb0kzJxZ9xOwezxzdBGeK/tAQHF47+nX1biLs7vvGcKFNkGMBgOUn?=
 =?us-ascii?Q?jvmDJ7nN0Lprv3XNcwGmbtwKBlGfjhZl9yvYfioP+gr3ylGN2PJqzjEaNlpF?=
 =?us-ascii?Q?o8jBpeWiGx1eL1JmX6ogQySUoZrTz5Nl+DK8uSWgvNsv34s6yMptL0rB3UbA?=
 =?us-ascii?Q?wrkwo1+B9OA5CNdzMW6b/e4E4xswTdDElWqjavTTjyYTY5ruPGwnrxChGTkq?=
 =?us-ascii?Q?+a+a4iooE7HGysKxysrPOsJjLjMmZIgeoKL6t7+1emFN/1YzFEG24Ao5e9g9?=
 =?us-ascii?Q?f28+Yw8SnV+Nj9wrhHbCoqrZV+3NAXSd5qbEIhkoVMSN3G0B0ob65AKRBmvA?=
 =?us-ascii?Q?doXKF6MOA5IDc0ra7fvX49iaQB8ynBypP0V0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(52116014)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EqoKh+NrV9nbnnqd2l7x0IUCU1Az6BC4YzmDmQojompxwsh09f2ZBSkroT22?=
 =?us-ascii?Q?TOGw1yamj4X2bIsPEh17hvENDP2MGeKaX7adW/ST23sxbgQv4CpXljVi1BN0?=
 =?us-ascii?Q?sWxVeV87LeDgugQGqyG3jNEOv5PoQy1jEHGlXWhw9RrTr8oijuQyOIj451jx?=
 =?us-ascii?Q?CQpk84VUeabNwzMJOCYlDf+U7/bHRlCHhPMkTn6eb9ej/3Qv1kuN4kMu97oj?=
 =?us-ascii?Q?lDGpOw29ctij1JN4ExnG2bZm6476ZYHb5R9HQUybMVPpRi0If52/gGZ3dsYi?=
 =?us-ascii?Q?gKcltPY7y8Z5JMtKUWHi8+kA4FbcUPwv2SUEYfimGc39//oTz7ZCOkCsdQX+?=
 =?us-ascii?Q?UC/YUgCXxuAZR0PNEaOZgyTuQRFkWRSJDVrH55/703vwo9V3TOVll92KLkzD?=
 =?us-ascii?Q?nSlIQTMvCuCrTnr4Fp640/Z2CjgNO9kVA1mhtz37cIDS8yjgvaMVyow4KrhC?=
 =?us-ascii?Q?IECisJxjWfYuuxA5m6+u8miyHZ7tGaYVX0xNeUJr6w4u/uiLAKLL4IwCKwra?=
 =?us-ascii?Q?yu6cxFQvjjmh/1ipurhgHVCtJitpmFh1YVl4YLErbjuSSWnGiUQSJtHUEKFE?=
 =?us-ascii?Q?tgfQusj1zYcpaG3mCuGkdXLxNdzlBqxCtLA03a7lsFawiCrP75F9BPX2mT0B?=
 =?us-ascii?Q?CHt1M3pSWIjm5jf2BDgnmN6sGVIDsk71CDxQ4ZNxTDuOMvoBPmqg2fXdjQ70?=
 =?us-ascii?Q?RbOlpqgbron0q3syMd568fAoEUUs7IxUlrxB/sJ8IeQWKHzrSLisNgQX0nHJ?=
 =?us-ascii?Q?W3g3cMQXRcRdzVdnhyHvEv7Wik/2rR35v+tB10hehVTIx2qVrZygONMre5wc?=
 =?us-ascii?Q?PQlAHjhjS/IxDxluocBQPIUYTzFSriVFBAQo062L3EL73toqPQ/MMV5yq3yX?=
 =?us-ascii?Q?324a0EfoyqoE60qPMUtnvHcWlgoT7TjLxSiyU/Dp+a45JONBor5lZA+mTcnp?=
 =?us-ascii?Q?UwbD0hALCRDBfgSzRIKtNtsB0ISzt5R+yhDU7OVajNPgfQNcAed6KBO120N9?=
 =?us-ascii?Q?Vzqj+of1v3/FcfmqK7FaXw6aeWxQf4B6R1zWN8tgo+xnSBOhSHJ53YPiuZgq?=
 =?us-ascii?Q?VEVG8hxqwVJY6lQ2/FjjtWlXdnpYfLhrG+yDjQ5qP6At0jV0WQnYKW7S/BdG?=
 =?us-ascii?Q?M1HkqQy66ExJ6Abuftti2U19N3N3k4/TsoLjgkFrFHVrmce0SJF3rmC94ALo?=
 =?us-ascii?Q?A2AFUEpweYDCG2uFyCGKr+qOvjWY8aJ0Xnnvv5hRLJtg3SFSmlsPYTENDScZ?=
 =?us-ascii?Q?7NYgnuXHFVNJeji6WcDy3qGVqHjzFCvNzNlBWQHOGp6vb580C4Pv7FAJtfpI?=
 =?us-ascii?Q?Uu0lIr/co7arO+ZkKNfR8W4Jlp9hbD9j+xoz9cHyi7eGjpjHbsQvhYagm65x?=
 =?us-ascii?Q?aOIImYlCMwwyf1DnObM9d8s7zKaMj+Q6aB3sDfYM20fyDJcB/z9TPol3HfRU?=
 =?us-ascii?Q?orTOYIr44n7qWST17WSHo/V88XtSiI7jXThCEwdzYUnJPf9s/7e81JNK3Y6y?=
 =?us-ascii?Q?y9cqC4HVap38jmPdAapoVb8P3MbcLLRE5gMqkXLWDacsP7JqTLw2fleyeW5W?=
 =?us-ascii?Q?CnExnqRfwWTyW8i+X5tY6AATgnOZiVLzUwBmVWux?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b76a69d-4ba6-4631-fdce-08de3c0299fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:51:40.7166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdsgsCv9pl4SCnj/2fDBRTF+g0SR7X8p8Du9shGwD4y78zJD0MHq3nm34R51GkDFJZ/caFDVAkWVAoGysNDwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_095145_770726_C936CA91 
X-CRM114-Status: GOOD (  38.69  )
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

On Mon, Dec 15, 2025 at 07:37:39PM +0200, Adrian Hunter wrote:
> On 12/12/2025 19:46, Frank Li wrote:
> > On Fri, Dec 12, 2025 at 04:08:24PM +0200, Adrian Hunter wrote:
> >> On 11/12/2025 18:44, Frank Li wrote:
> >>> On Thu, Dec 11, 2025 at 03:48:08PM +0200, Adrian Hunter wrote:
> >>>> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
> >>>> multiple I3C Buses (up to 15).
> >>> with single hardware function (e.g. PCIe B/D/F).
> >>>
> >>> ...
> >>>> with one instance of the HCI Register Set
> >>>> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
> >>>> hardware function (e.g. PCIe B/D/F).
> >>>
> >>> Each I3C bus have indepedent HCI register space and I3C Bus controller logic.
> >>>
> >>>>
> >>>> Create an MFD cell for each instance.  Use platform_data to pass the
> >>>> instance's register set start address.
> >>>>
> >>>> MIPI I3C specification defines an Extended Capability to hold the offset
> >>>> of each instance register set.  However parsing to find that information is
> >>>> relatively complicated compared with just including it in the driver data.
> >>>> Do that for now.
> >>>>
> >>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >>>> ---
> >>>>
> >>>>
> >>>> Changes in V2:
> >>>> 	Conversion to MFD split into separate patch
> >>>> 	Simplify ID allocation / free
> >>>> 	Correct use of __free()
> >>>> 	Also define instance 0 in driver_data
> >>>>
> >>>>
> >>>>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
> >>>>  1 file changed, 50 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> index 68088967942b..de1f71763786 100644
> >>>> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >>>> @@ -19,10 +19,17 @@
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/pm_qos.h>
> >>>>
> >>>> +/*
> >>>> + * There can up to 15 instances, but implementations have at most 2 at this
> >>>> + * time.
> >>>> + */
> >>>> +#define INST_MAX 2
> >>>> +
> >>>>  struct mipi_i3c_hci_pci {
> >>>>  	struct pci_dev *pci;
> >>>>  	void __iomem *base;
> >>>> -	int dev_id;
> >>>> +	int dev_id[INST_MAX];
> >>>> +	int dev_id_cnt;
> >>>>  	const struct mipi_i3c_hci_pci_info *info;
> >>>>  	void *private;
> >>>>  };
> >>>> @@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
> >>>>  struct mipi_i3c_hci_pci_info {
> >>>>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> >>>>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> >>>> +	u32 instance_offset[INST_MAX];
> >>>> +	int instance_count;
> >>>>  };
> >>>>
> >>>>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >>>> @@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
> >>>>  static const struct mipi_i3c_hci_pci_info intel_info = {
> >>>>  	.init = intel_i3c_init,
> >>>>  	.exit = intel_i3c_exit,
> >>>> +	.instance_offset = {0},
> >>>> +	.instance_count = 1,
> >>>
> >>> just one instance? suppose at least 2, otherwise, not need this patch.
> >>
> >> Adding multiple instances is in a separate patch
> >
> > Okay, commit message should mention it.
> >
> >>
> >>>
> >>>>  };
> >>>>
> >>>> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
> >>>> +{
> >>>> +	for (int i = 0; i < hci->dev_id_cnt; i++)
> >>>> +		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
> >>>> +}
> >>>> +
> >>>> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
> >>>> +{
> >>>> +	for (int i = 0; i < nr; i++) {
> >>>> +		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >>>> +		if (hci->dev_id[i]  < 0)
> >>>> +			goto err_free_ids;
> >>>> +		hci->dev_id_cnt = i + 1;
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +
> >>>> +err_free_ids:
> >>>> +	mipi_i3c_hci_pci_free_ids(hci);
> >>>> +	return -ENOMEM;
> >>>
> >>> You have to handle ida error, actually, it makes not big difference with
> >>> mfd and add multi platform devices.
> >>
> >> The ids have to be defined in any case.
> >>
> >> MFD still handles:
> >> 	Setting the firmware node
> >> 	Deleting devices if 1 fails to create
> >> 	Removing all devices i.e. mfd_remove_devices()
> >
> > Actaully, why need remove previous failure device. assume support 15 device.
>
> Keeps things tidy.
>
> >
> > 7 success.  failure at 8 instance.
> >
> > I think it'd better keep 7 already success devices.  So 1-7 can work.
> > 8-15 can't work.
>
> If adding devices fails, the system is out of memory
> or in some catastrophic state, so there is no need to try to
> cater for that case.

Okay, I remembered system use defer probe to resolve dependence problem.
It is most likely all success if dependent device probed.

Go ahead, sorry for annoise.

Frnak
>
> >
> > It should be better than total 15 instances doesn't.
>
> Not necessarily.  If whole probe fails, the user might try again
> and succeed.
>
> >
> > Frank
> >
> >
> >>
> >>>
> >>>> +}
> >>>> +
> >>>>  struct mipi_i3c_hci_pci_cell_data {
> >>>>  	struct mipi_i3c_hci_platform_data pdata;
> >>>>  	struct resource res;
> >>>>  };
> >>>>
> >>>> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
> >>>> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
> >>>>  					struct mipi_i3c_hci_pci_cell_data *data,
> >>>>  					struct mfd_cell *cell)
> >>>>  {
> >>>> -	data->pdata.base_regs = hci->base;
> >>>> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
> >>>>
> >>>>  	data->res = DEFINE_RES_IRQ(0);
> >>>>
> >>>>  	cell->name = "mipi-i3c-hci";
> >>>> -	cell->id = hci->dev_id;
> >>>> +	cell->id = hci->dev_id[idx];
> >>>>  	cell->platform_data = &data->pdata;
> >>>>  	cell->pdata_size = sizeof(data->pdata);
> >>>>  	cell->num_resources = 1;
> >>>>  	cell->resources = &data->res;
> >>>>  }
> >>>>
> >>>> +#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
> >>>> +
> >>>
> >>> It is not good to hide hci in macro.
> >>>
> >>> mipi_i3c_hci_pci_alloc(hci, x); or
> >>> mipi_i3c_hci_pci_alloc(nr, x)
> >>>
> >>>>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
> >>>>  {
> >>>> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
> >>>> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
> >>>> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
> >>>> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
> >>>>  	int irq = pci_irq_vector(hci->pci, 0);
> >>>> +	int nr = hci->info->instance_count;
> >>>>  	int ret;
> >>>>
> >>>>  	if (!cells || !data)
> >>>>  		return -ENOMEM;
> >>>>
> >>>> -	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >>>> -	if (hci->dev_id < 0)
> >>>> -		return hci->dev_id;
> >>>> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>>
> >>>> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
> >>>> +	for (int i = 0; i < nr; i++)
> >>>> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
> >>>>
> >>>> -	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
> >>>> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
> >>>>  	if (ret)
> >>>>  		goto err_free_ids;
> >>>>
> >>>>  	return 0;
> >>>>
> >>>>  err_free_ids:
> >>>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> >>>> +	mipi_i3c_hci_pci_free_ids(hci);
> >>>>  	return ret;
> >>>>  }
> >>>>
> >>>> @@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>>>  		hci->info->exit(hci);
> >>>>
> >>>>  	mfd_remove_devices(&pci->dev);
> >>>> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> >>>> +	mipi_i3c_hci_pci_free_ids(hci);
> >>>>  }
> >>>>
> >>>>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> >>>> --
> >>>> 2.51.0
> >>>>
> >>>>
> >>>> --
> >>>> linux-i3c mailing list
> >>>> linux-i3c@lists.infradead.org
> >>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> >>
> >>
> >> --
> >> linux-i3c mailing list
> >> linux-i3c@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-i3c
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
