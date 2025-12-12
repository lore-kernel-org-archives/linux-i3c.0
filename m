Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84285D59D77
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUFmIkF2jDND+cxAfRDLYYbI5LuHrPt8Gm2emfuxydw=; b=kMPzl0dmeBmvYt
	QdmVobCYeBnfECwVp0t+G7DGLESzW2bE/KiX8MwKHMzNyEoOtnxH8W3ueUrSe7Qz300VBsu04vRLo
	T8zkkLrDiPJ/GK1NaI8nS9LdM5LNo/Db9YPWBRhpA1F2V+Q09czfvmlmnKtlP4LR/t/g+C5z1qnSU
	qPjukhvRHlgu5pAmGiaG9hyL1uB0JzubDopDyosMLm6l0DD9QsvrmrkYCe+r4Ph0H2LqDm5q3bSzy
	IAqXsJjssLzdod/NFIP6iJSJfhaJpBimfjJvnWVAkUxKf8NOjAy4JrO/Z+RiIP3ptmHRCZIeuQEjm
	pUp0WLc9KhgrdLpyNlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7E2-00000000uRr-0TBi;
	Fri, 12 Dec 2025 17:46:42 +0000
Received: from mail-westeuropeazon11010027.outbound.protection.outlook.com ([52.101.69.27] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU7Dy-00000000uRS-47Hu
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 17:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnqpPErQckiKhZ6dIs0hnXSd0DhrDiWf1EV9rbgZfczshN3xVsjNq2rSrD+1KCo+1KAvAAE4zHHegJOh1RkewLI5CRa3iduErBCMOIQDGhpCetzeLS5Grm8GdLb9lh0iFWMme2BVvKWjHekKqIeXmcH8OHInG/HdO0ilM7DCSOK3ib+katbjU6sflqq1i4CQ9ysAOiCQktqhdFVDfXkgqhe3dYQvFMUuALW5dl7QofZuRhICLHwcwvYRizAh35X42umMXe3rFCacCJr1LTlXZ0FtavUIDbYndivThobOzKh9zo2UMHs82plsqByTyTlKZtqSOGPG1IACAzpu8h0Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBls4jbbGi2QbXXque3NFlEq00sXMHwC/m7hP1YKbxI=;
 b=FeUOkvEHSfU0FkrtbRUkDBYsO/7VGk1gm4QZLda8Q/KS0fL/R4et3p+TwjcYPRkGPK2LxRBjsIfzxC2xlepAnvzh6z0xf3gNJKw7E5XzXtifVd6K4kHZ1ylq7aMS1n7pkgr8ZBWdvbIRkgMUynMXKf6h50Frju94adxlZjPu18Gnomwdmc6jCmClVyZ04vbXzFg9UP0T+hzr6nR/Zl/RapGp189qTf7tM5ePZ5/mAB+KRn0tmMcSipmuyzcAEWg3i422TXi9HLGLGcaDBSbnfzvcF1kZk7dgF5ZbrKJGGPPnrmJHAB1olzPycY6DpGm7goArysnNE1IUQaURMz8wKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBls4jbbGi2QbXXque3NFlEq00sXMHwC/m7hP1YKbxI=;
 b=XQM0H9KVXoDDd5ijcUY7+Xb2cuZ62e761fKwpJ8Mb3lY2MxHqy8g8g42ud4fqIViioCCv3LSdYR9YHBics2ypp1F1RbTLBorWdy9E2KdkhfiW0td8leH7/NT17ru1jWYazA01CkDlQliaBELWotbft+jkjJvTS81MWKW3AxJNvFmTZTpzrINZzwrG+61Kuq/8ScOTEeZBCwmUm0SdkcSGHo2IB9jhJiCDC0+dzV5YX3ddo5ExUGgnAyqV68DxwEQZLIPY1Qsk3tiPO6iHHj6Wul86KWhwvp91mS2JY9sMSNxIyvQk9//t5L9aNuGgUJbsf7OV9SN1UYiMmPGE7kvpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by OSMPR04MB11293.eurprd04.prod.outlook.com (2603:10a6:e10:93::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 17:46:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 17:46:34 +0000
Date: Fri, 12 Dec 2025 12:46:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 09/10] i3c: mipi-i3c-hci-pci: Add support for
 Multi-Bus Instances
Message-ID: <aTxU9AgDyi43zDyq@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-10-adrian.hunter@intel.com>
 <aTr07CVVD0YSN4Ax@lizhi-Precision-Tower-5810>
 <a2f817dd-99ae-4631-8879-8c2f9bc2d6cb@intel.com>
Content-Disposition: inline
In-Reply-To: <a2f817dd-99ae-4631-8879-8c2f9bc2d6cb@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|OSMPR04MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f891551-80a7-4838-6846-08de39a66479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|376014|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tpp9+aSm8FPVnKqgDDn6CX3B588wfP8a1ASsjRCLVVTUAvv9aMlJPf/suBdQ?=
 =?us-ascii?Q?uXfrD5k23XA98zg+OLOWxJ2brRXGapQDem8ic+EhUqV68b1PrhuizFf7BR91?=
 =?us-ascii?Q?8+vEuUI9ONvE+Krdyeaxc0OPvvAu0DbaKc4qofmm7mXKQaupueMGmxsjvYqM?=
 =?us-ascii?Q?FdnQSrCbQcmqKF1Jp/p5xBLA91Fli1GqPbjEgUdP4LzyB+dQ2vfTCBzavDH1?=
 =?us-ascii?Q?8zXrcoUDhrtbdGXSXpDimX8QBtIf4iZ0863nu77spa1VmQ+CsnGbjc6h0aop?=
 =?us-ascii?Q?hhboRALAytfX1BnQmjehNOuYw0ZUXmWDn17b6sHIO3wmehHgH7dhWfAzbOSs?=
 =?us-ascii?Q?Fgp+RpNhB8kTTMFo5xty3991hpWUdplIInZJVfD4umT2p34YoVafpvB5xlDr?=
 =?us-ascii?Q?Cdvwr1+F8Tl5mYM8Kqn3EEJWmEc2O7RzbfF6xBESRE37MA+C0ua3U6Wm9lhl?=
 =?us-ascii?Q?wUzjXLCMShvi9oCyT0hcv8grybRlLlHHh5CIbfwxzn9RgHJcF9K9/3U3ntn1?=
 =?us-ascii?Q?g+twDKR/bSrX/ehuYQ9SwDNCEP8PwqxwClM0HG7JV3a8hX/IlZrSazvS89o1?=
 =?us-ascii?Q?nfuJDSpDTX2HZX3owYPm9gPodY0pVoM5vZuuKMT0/a6//yRy4Z5f8odouHPq?=
 =?us-ascii?Q?+MNvVYuVl3CoS3n36cVVgR+SkOoAeot0TPsWh24hgW5bHnKUSph4EgOLiwmQ?=
 =?us-ascii?Q?A3X8+OmiNjdbo2GF71SnsxN+JiHtAua+Y5wnyzal+aud6PjvWPy8zOs6RYx/?=
 =?us-ascii?Q?Z7P+7yRSYdZqoJiK4o3sgVUAnPp2Ti/RuE3ocsKEasgWXy2YSTQem2/3lYlM?=
 =?us-ascii?Q?6G5SF0edmHGtmej+zhDT3gGkAncfYwLMAEuIiP5fqzLK8ILAe2RZ1VLi09RX?=
 =?us-ascii?Q?4UJ7WFPZNBP12k8GAkZ3KPchKJ58RBJN3mjLErj6dLYn/NYmfnm4217o6DnO?=
 =?us-ascii?Q?6LHflDlINHhWJ3zTVSsL6Hbb6DGRQL5VjIw37rlPORfPGxl9qyeaIF1K7jBz?=
 =?us-ascii?Q?12oC9TH/JsFghGftgPqu99Of87JQPJfbn0CADM1I5GllADDP0owRIhQTShSL?=
 =?us-ascii?Q?doJiF46LkDil84TWQoKLxlx1CfhahYs/hx3vEJB4cDgO1IN4DhSvJczzc88K?=
 =?us-ascii?Q?eMOITuXMTz/7S6IA02Bhjm1CYhxispmsmRDzT3TWuEVVjFqmcBXxz11CtPkk?=
 =?us-ascii?Q?OiZfrgZESLaA12N1hEY5AnwWbARcKf9r6/zUzGs9rw5zm4IuVeYonjolJvlt?=
 =?us-ascii?Q?REgbBsHfGDR83JgtJckdjv01Qfy9bA66QC157yfkWPZuJrrdL0C4RQnO4j+H?=
 =?us-ascii?Q?ReULXv5sX3py7NsAhruoNKqtDIAoDxHBw53laE+jWBhy4DRWbqx6J+KTuBOu?=
 =?us-ascii?Q?gs87Ujjx1zErqoQH0tsz4cqts5J1tZ8BwGgiEg7139K8f4cL45BQFbXW8bu3?=
 =?us-ascii?Q?Qu20r/qjgsz/DLY+66CxY9H078+pyAZmwQcdiQjoZdu9RemYQlSlxqhjtJAI?=
 =?us-ascii?Q?PYCEQKNPFSUk04Nwn5Ooss55Ej9HzLnjWXCT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(376014)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rhahOQrMqnaTxJJiC2JOPxTksWNiv/Cng+5nNtTPN2LtWQ3ee1DE8plzIGwc?=
 =?us-ascii?Q?lkFgKNyZig+uXuNu6tpDB5tdZ5w/DbKp8exJAcX1VFsjkDQDP0yJORIvNF1U?=
 =?us-ascii?Q?0COHM8KRYTf4z9kgpyfxvYEFmSBWm+OdR+1orw1gpFha192I1Bajss093hfU?=
 =?us-ascii?Q?95fTPHQmwDL+euptd9q2fcIJp4WDpAK64RElIBELs1xCwcrpy5BNdRrZKV74?=
 =?us-ascii?Q?Cvtt4dqvXNigfuYSag8Q+fhN8SgnVXhSPBUvnX9FQwUdAS4iq3lXverhpcir?=
 =?us-ascii?Q?LraJ6MQK6opXXEVtp29WSBYZjuleLtiiwEItKZO0O0ZgrzHJNeMN5lOKDj/l?=
 =?us-ascii?Q?UzPD4kpn0oZyr1X85M6P4Gj1UNngd1pwZiZZvEAcd2jGDzCk1ajFYVLA6sdW?=
 =?us-ascii?Q?fa3kNbPeuRI+dl+msj7dJEZCDFS980ZkQONcSvGK9SQid6YbvdzNCLEV3JCR?=
 =?us-ascii?Q?iTziefdEN+SExykKy1eAdtFnQptJ9I3Lyn0WJCmsML9qFrick+RhlNoKb47e?=
 =?us-ascii?Q?LJOHCOV+h/i8MxZ4SiyJX8kMroXDsIm9yUxj1mJDocAYnXvW++L8jwuXBXQF?=
 =?us-ascii?Q?4ul9W+ah3kZJYAsODRRbrgqOEP7wR5as7SKOpWjlBhNjd94e2Yqv9e3Pma5V?=
 =?us-ascii?Q?HKY7qvXx73kCJNwxEG/aFufSzkgafdEZ62ba/pxUB5gSpFLtCcYMJYBWBiaG?=
 =?us-ascii?Q?i88drWIhr+1i3gciIIqQG1fKGB59Kh8tUQPpBgYRgD2Y/Q5WplcJsZF7eOrj?=
 =?us-ascii?Q?yEczWMzLwcGurfOqc87uGBvowoJXaeYKTFPQMJoyV+JzXERU6DpNqOWpzSaP?=
 =?us-ascii?Q?mMWznTJeUbYB/qX1VEFbug1b9/QsVdvPH/0NTe403xwQUoedPunpcYkgpDmD?=
 =?us-ascii?Q?3DVtQ4KZwmYg4elbqBAZROCkS4bmqD6XWKmTr/PjBnMHex8t7gbgUXEvTyQa?=
 =?us-ascii?Q?J+FOmWP/J+5vv2YHI6me3+WvDRRsp/5+YNa/7pLOxodIdfA1uXTGBB3dQPrQ?=
 =?us-ascii?Q?kVxj5vFrKg9g8Jl8eBcBD+AbzonMV8xGpSLac8uiZgrdT305xdcAD59bndUs?=
 =?us-ascii?Q?/qlVwQhH26+cxj1OnkmFib9Gqq9hfU8+s2eR1RhdbOI1x8BB8KVhsmFHv9KT?=
 =?us-ascii?Q?afYwMAY0vILi4eevAnBrLeZnDOc5soi1zyY8k6wDvd36jFIaHo8KqGpu2FA2?=
 =?us-ascii?Q?gxC7BAm50O0+gzdSXAl417gy/oY8FZvIE3cZjOhZHCveTgHNT/58FJMu5iXQ?=
 =?us-ascii?Q?1Nv2TQs4uZriTpAUnOK00K9t6jBi8DV3heFo2J+35HzJpLmJsZdjWJRFAes4?=
 =?us-ascii?Q?YCQ9gonE5sk4MpaROz/aW+F/0D84Lc8hgyu2+1CwbaHgdaI7SG3b/gUH4r1V?=
 =?us-ascii?Q?UUjx0rL5O4lg4VYOo/iWI6AqPv5OzaXlmx+R0l7YsySt9A24zM2pr4thxaT8?=
 =?us-ascii?Q?YzG74KzYSCH2J5lKHLYSKgqAr2kdOXqBbKcaqxSgVeeqz2nU09TfwRYoLpYu?=
 =?us-ascii?Q?5BDdKqHbNJPkgXJBGEvYzsA/PjIiurPiWxX9FFjAxmdJqJbWtqmIHcTAADXC?=
 =?us-ascii?Q?2uumiJd/ZW2od4Gaw4A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f891551-80a7-4838-6846-08de39a66479
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 17:46:34.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkDxS6Po+RTz6wIqlm66QWNrnNV6u9xSWTvJZmrq6UyjQfGcT/ogb3YGpeiIst42xSTJjO34akUFFi+w84z3GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSMPR04MB11293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_094639_177854_74B08E3E 
X-CRM114-Status: GOOD (  36.57  )
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

On Fri, Dec 12, 2025 at 04:08:24PM +0200, Adrian Hunter wrote:
> On 11/12/2025 18:44, Frank Li wrote:
> > On Thu, Dec 11, 2025 at 03:48:08PM +0200, Adrian Hunter wrote:
> >> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
> >> multiple I3C Buses (up to 15).
> > with single hardware function (e.g. PCIe B/D/F).
> >
> > ...
> >> with one instance of the HCI Register Set
> >> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
> >> hardware function (e.g. PCIe B/D/F).
> >
> > Each I3C bus have indepedent HCI register space and I3C Bus controller logic.
> >
> >>
> >> Create an MFD cell for each instance.  Use platform_data to pass the
> >> instance's register set start address.
> >>
> >> MIPI I3C specification defines an Extended Capability to hold the offset
> >> of each instance register set.  However parsing to find that information is
> >> relatively complicated compared with just including it in the driver data.
> >> Do that for now.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>
> >>
> >> Changes in V2:
> >> 	Conversion to MFD split into separate patch
> >> 	Simplify ID allocation / free
> >> 	Correct use of __free()
> >> 	Also define instance 0 in driver_data
> >>
> >>
> >>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 63 +++++++++++++++----
> >>  1 file changed, 50 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index 68088967942b..de1f71763786 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -19,10 +19,17 @@
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_qos.h>
> >>
> >> +/*
> >> + * There can up to 15 instances, but implementations have at most 2 at this
> >> + * time.
> >> + */
> >> +#define INST_MAX 2
> >> +
> >>  struct mipi_i3c_hci_pci {
> >>  	struct pci_dev *pci;
> >>  	void __iomem *base;
> >> -	int dev_id;
> >> +	int dev_id[INST_MAX];
> >> +	int dev_id_cnt;
> >>  	const struct mipi_i3c_hci_pci_info *info;
> >>  	void *private;
> >>  };
> >> @@ -30,6 +37,8 @@ struct mipi_i3c_hci_pci {
> >>  struct mipi_i3c_hci_pci_info {
> >>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> >>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> >> +	u32 instance_offset[INST_MAX];
> >> +	int instance_count;
> >>  };
> >>
> >>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >> @@ -177,53 +186,81 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
> >>  static const struct mipi_i3c_hci_pci_info intel_info = {
> >>  	.init = intel_i3c_init,
> >>  	.exit = intel_i3c_exit,
> >> +	.instance_offset = {0},
> >> +	.instance_count = 1,
> >
> > just one instance? suppose at least 2, otherwise, not need this patch.
>
> Adding multiple instances is in a separate patch

Okay, commit message should mention it.

>
> >
> >>  };
> >>
> >> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
> >> +{
> >> +	for (int i = 0; i < hci->dev_id_cnt; i++)
> >> +		ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id[i]);
> >> +}
> >> +
> >> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
> >> +{
> >> +	for (int i = 0; i < nr; i++) {
> >> +		hci->dev_id[i] = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >> +		if (hci->dev_id[i]  < 0)
> >> +			goto err_free_ids;
> >> +		hci->dev_id_cnt = i + 1;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_free_ids:
> >> +	mipi_i3c_hci_pci_free_ids(hci);
> >> +	return -ENOMEM;
> >
> > You have to handle ida error, actually, it makes not big difference with
> > mfd and add multi platform devices.
>
> The ids have to be defined in any case.
>
> MFD still handles:
> 	Setting the firmware node
> 	Deleting devices if 1 fails to create
> 	Removing all devices i.e. mfd_remove_devices()

Actaully, why need remove previous failure device. assume support 15 device.

7 success.  failure at 8 instance.

I think it'd better keep 7 already success devices.  So 1-7 can work.
8-15 can't work.

It should be better than total 15 instances doesn't.

Frank


>
> >
> >> +}
> >> +
> >>  struct mipi_i3c_hci_pci_cell_data {
> >>  	struct mipi_i3c_hci_platform_data pdata;
> >>  	struct resource res;
> >>  };
> >>
> >> -static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci,
> >> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
> >>  					struct mipi_i3c_hci_pci_cell_data *data,
> >>  					struct mfd_cell *cell)
> >>  {
> >> -	data->pdata.base_regs = hci->base;
> >> +	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
> >>
> >>  	data->res = DEFINE_RES_IRQ(0);
> >>
> >>  	cell->name = "mipi-i3c-hci";
> >> -	cell->id = hci->dev_id;
> >> +	cell->id = hci->dev_id[idx];
> >>  	cell->platform_data = &data->pdata;
> >>  	cell->pdata_size = sizeof(data->pdata);
> >>  	cell->num_resources = 1;
> >>  	cell->resources = &data->res;
> >>  }
> >>
> >> +#define mipi_i3c_hci_pci_alloc(x) kcalloc(hci->info->instance_count, sizeof(*(x)), GFP_KERNEL)
> >> +
> >
> > It is not good to hide hci in macro.
> >
> > mipi_i3c_hci_pci_alloc(hci, x); or
> > mipi_i3c_hci_pci_alloc(nr, x)
> >
> >>  static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
> >>  {
> >> -	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = kzalloc(sizeof(*data), GFP_KERNEL);
> >> -	struct mfd_cell *cells __free(kfree) = kzalloc(sizeof(*cells), GFP_KERNEL);
> >> +	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(data);
> >> +	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(cells);
> >>  	int irq = pci_irq_vector(hci->pci, 0);
> >> +	int nr = hci->info->instance_count;
> >>  	int ret;
> >>
> >>  	if (!cells || !data)
> >>  		return -ENOMEM;
> >>
> >> -	hci->dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >> -	if (hci->dev_id < 0)
> >> -		return hci->dev_id;
> >> +	ret = mipi_i3c_hci_pci_alloc_ids(hci, nr);
> >> +	if (ret)
> >> +		return ret;
> >>
> >> -	mipi_i3c_hci_pci_setup_cell(hci, data, cells);
> >> +	for (int i = 0; i < nr; i++)
> >> +		mipi_i3c_hci_pci_setup_cell(hci, i, data + i, cells + i);
> >>
> >> -	ret = mfd_add_devices(&hci->pci->dev, 0, cells, 1, NULL, irq, NULL);
> >> +	ret = mfd_add_devices(&hci->pci->dev, 0, cells, nr, NULL, irq, NULL);
> >>  	if (ret)
> >>  		goto err_free_ids;
> >>
> >>  	return 0;
> >>
> >>  err_free_ids:
> >> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> >> +	mipi_i3c_hci_pci_free_ids(hci);
> >>  	return ret;
> >>  }
> >>
> >> @@ -281,7 +318,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>  		hci->info->exit(hci);
> >>
> >>  	mfd_remove_devices(&pci->dev);
> >> -	ida_free(&mipi_i3c_hci_pci_ida, hci->dev_id);
> >> +	mipi_i3c_hci_pci_free_ids(hci);
> >>  }
> >>
> >>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
> >> --
> >> 2.51.0
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
