Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4C9D3C920
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFIW16f13WipfeRQeRuXuO9i3z6tfhLbcb/rGz955nc=; b=dAOTzU03+vLYOs
	gArsCm54JyE7h7apwnPXLsnCuCxAdbCXeejZQ75sWtQYg6Gga0z9Q7kj0Qx0W2Vr2C24bCwxcycEJ
	gcsXZL9huDpXhA130FoA7X8gN+KX14rpwOvFNfgT830tugOJwmwKov2DL6Lm2p0aIyYm8AjWMr9mX
	DuGMA5NQcCPIq1yKh2FDpmO4GoVPaDRSiyd7kPiNS60GRrXqvBoVw9PNQz66ponPUojjUJ1QmAwtU
	mUSCzjnwIO4B9PRJEk5pQOhRlRQAZOE5utPGS+VzSTMFsbnFlGFRVZBCtgJaE18dmD2kkyq5IjJlF
	fDEGLjycxFJ2gA8fm/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLsa-0000000FY1l-1suw;
	Wed, 10 Dec 2025 15:13:24 +0000
Received: from mail-westeuropeazon11010068.outbound.protection.outlook.com ([52.101.69.68] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLsY-0000000FY18-0hCw
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 15:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwR6FDAuNUVNvHZOGRAGmSHoPv3j4zvnUTCjweRkByE/xKd8PsXob2kSg4GYbgNjZzeEEHrFCq/GZ+ahwvUdBcN1d63yGDaN2i6itWDVWT6jKe7zRgW/NdneGasP84URQRyMzndEKTd7XoSKcAyIDV1aayxcBqEFbc7cV83GhdZRI0ZOkd+TadV6ahYrNtpWwrk9Py9kiaZAp2Pza4ac8lGllTyFNmvqdO6t8qKdeLn9uCgZBPkx6VE4uKvpIlpjwokfCR8p9CeEuN3BaMvpASK28q9On7k3apa6QhyNWQXuMxukHbWc+nDLfU/hkxR7dY9RDbPOviGCSYp/zMpgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1etF0iN0eN7H5qRD7RtegrPblXhun06a4ytCPleM4I=;
 b=dkSX8BJRWCgsEI4Ar27c9LNDo958W/cIgF/iNjYEWcvWYy6v/CIwNkgd5gyNh09e7oLqZ5PjkDN8E0lyMqes4jBt5jygxLlXSOAesg5Xj5HYLYKF1Hy+NpHfPqJRhD8R/Z3uZUXbfL0nGa/+uCVu/O7OSpHG8nAapc+jJiaHDPxN15q7gpVkDHhTqigxyL/esUVLn2hitEz7ZkT8D8jNgq3E8yYos2aE81YC0rIY6KDRt0wWG0lbXgyzB+vzHG+uUDr6kx1+JK3r2TJdFn7UaK1K6k2zJikX3kSjh0L3mrqMj9ivBA0Z1g+j7kAE1nXJX2QuN1Fw85JYVCEc66WdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1etF0iN0eN7H5qRD7RtegrPblXhun06a4ytCPleM4I=;
 b=Q1vyp0dzfq+/xawh65T5p+yQW+Ksti5RY/EmWNu1hIikgcVMuvyIISyHN1WVrHeAu55nkMuuhDCsxkNujQenex2SHXSQWZPQL3Rd23SDgJpe+lDOwBF29GdLKrNXG49E0DnZhkRy975GGov5FaGE80dgCLmvQAAZQoDZLYpDVf+iLehZKm04L99ak18XIGaKiO23bQhjbD7hmoUzjGpFDa6DMSQRDdZd0bmUJehp+cHhsGP8ePWnLCVyUWpLfYVyrGs8cQMib6hvGFiPM4nuGj0QQC6AUp82FRXhsFRmlkbg0UWbV6Y3dJwigdH5zcGi9NleThdcJA672MD7gNl1jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DBBPR04MB8042.eurprd04.prod.outlook.com (2603:10a6:10:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 15:13:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:13:18 +0000
Date: Wed, 10 Dec 2025 10:13:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 6/7] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus
 Instances
Message-ID: <aTmOBRVFH2CJkb8x@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-7-adrian.hunter@intel.com>
 <aThYEy/L2Ou8tDeF@lizhi-Precision-Tower-5810>
 <b95d09ab-2101-4a79-b186-3f58cf32506a@intel.com>
Content-Disposition: inline
In-Reply-To: <b95d09ab-2101-4a79-b186-3f58cf32506a@intel.com>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DBBPR04MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 96064be2-451f-487f-94a5-08de37fea629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|1800799024|366016|38350700014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?huJIEdSNhERheRuC2Ihcmb7lSjOk4ILn3nyD7Fk+Ea4ncC8kj0lD0zzPPBca?=
 =?us-ascii?Q?dmgf8G+K2YW8Wf7NDxLwh29wPklHeywegXXSAaa6ovmzkj7Z8G9K3RY2raXL?=
 =?us-ascii?Q?yJHizu9Kix05wa0BRPj1DuQKrTswZK6eyF5cyLJ7+JFzCTHafqb3YbhXGYF/?=
 =?us-ascii?Q?UpmK/pnL0P/YsmhTbVjUcH34qXAHiXzmScmoxHcA1J9V4liDmvS1asFJKt8n?=
 =?us-ascii?Q?y9CPJR5kfUZIzjYGUjrNbhGaMoGkkTKoQ7oIwyXPx+bxp4ctwbPsztxIpYoj?=
 =?us-ascii?Q?uKHkY1cKKpWebfyEnJaBwkkj9wn3AhwSE9LVHOqrzYgnVVHtYH6rdp34Cs4F?=
 =?us-ascii?Q?c9oI1js6Knrz+GYGyFDX6D+gY3QqVw1XOBiefoRhjbxgSOCUHiqsgsj9ecPL?=
 =?us-ascii?Q?WvCJNGJMOSftAn4k7fEBrqnV3I3wkJq0/gEGQe/xBgfTDvPADiDSuuc5Qqts?=
 =?us-ascii?Q?Y4ZjG1r5XjzzRdmPoh7srb/CYwTYMrlEsqCmx+tVpu72n/9WTY0MGrX0BYl3?=
 =?us-ascii?Q?zX2Dy9YxSmFJuCf3Fu1D1kkeXNRd9QSHetCuIhriAgKMhKJjInekCzEHDFxm?=
 =?us-ascii?Q?qO4S9/hTjf3q7qxvaCJ6YGufX++nBJ5W9JzJVVTib4csdjISlmxJ0mCqb4Rj?=
 =?us-ascii?Q?S5cSD9AoZo8voXkE2gzlTs8Z7lIppmec/iGiqlyq9BXBLy1C4I3JNULUzqh1?=
 =?us-ascii?Q?jk3hMmh0QzhbXVZWTgIKoQQlIOOLn/28mqVmkBFpHPjqDRjRjPOnd4z3J3FU?=
 =?us-ascii?Q?zEyeEpDjGAc+H9Qbeq/I1xPuoc9i+pVOErWoxhMltlu1IYUpoXp5ryJcZtgn?=
 =?us-ascii?Q?ndUF6oOf2YQ1LGugbOMuiW430EERH0PYI3hSIL4GJ4MxGx9jBhhPL8AOJeRI?=
 =?us-ascii?Q?rAEJXHvjv76tDwbDbgOPUudjDyi8kF4iLN/dl7gkr88Sk0eTTfjUlvSVPvCX?=
 =?us-ascii?Q?bLWSnsHPs1pmOQ6qEO8GF+JTfRdcUNvv8Ft9N1lsL8Xmo0yUsDilk+bvpkpq?=
 =?us-ascii?Q?Yk8RI9IiMy4F809eFojMy4nsM+BLPG2Zlzrvfz2tL7umPbwSOzddlkxhqdRk?=
 =?us-ascii?Q?g9ZZGshuuqKywsQYcC5KJSrh6J/5bQxvddOp53bXTyvqykThwruq8iqsvaq0?=
 =?us-ascii?Q?T3Sp523yXsHd78yaxNyzRvQSdiKZ1vTPTdQO83ElDGZvzkN/pko3ngyLwPJK?=
 =?us-ascii?Q?JNc6NkrNL1vf12+gmclqfky5xICLTQ62ipZfTvbIZ+mncgU/xf6hDssdx1iN?=
 =?us-ascii?Q?4NoYq9HHp42XQ/jHelMac3MhdEOzs0ONfmXmhaSrz5BK0bwJptBmMz+/iSkF?=
 =?us-ascii?Q?0+wNdZwBGejcaALsUoVg7NrqiL6jlMJMZdBLmUw1I1pDpRsSmn2ZY0UxNuBR?=
 =?us-ascii?Q?lvemccEwXwzxvbcQVvYoqJ4Cy8MBrO47Y8h9xjJUUs2SgJO82TfDcF0X/JO8?=
 =?us-ascii?Q?AaSPfSqYJd8GopKknwPSpxY+Tf8XpszUG9gkRBcCWInDMv5N8ozQf9DeXp6T?=
 =?us-ascii?Q?ckSssBJxhaXb6cEBm4fLCwjSVftNW02nAUr4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNS/xm+it9neILcTVSJv/2v/U6bI/z/33q3xBdio2jfNv3ZZWVnWNoNrqT0a?=
 =?us-ascii?Q?JzEzcBpBv+GRkPF9IQf4NDDtR6V2N10xxMPP4/1Vus1oK+qPkNO0swetO/oU?=
 =?us-ascii?Q?zDe5YSmxtkJnvf6HCZxdCXURvukUj03hpsP8D1XttLHlhXTwKBfAlRFAq3dr?=
 =?us-ascii?Q?61PIH4EFtK6ihta/AhzNM7fGbl8cUFAvlVZ8cWM0lLo44moG3zBlSBPb1nqf?=
 =?us-ascii?Q?42kdPVQqvSLhhY202+ET4JZ/2+vkvKFnv/0x2ktUAoGMlo61nPERY2vbhLJa?=
 =?us-ascii?Q?XZ9PpWu+Hb2e/LIafxHaYI3EYOo/L+AuY7XXJ0Gbze5oTgENduRzPgVm6jw0?=
 =?us-ascii?Q?gEF+ml/5TsVGJ9OsDZxiXvNZrXlj/WRTr3HypeVJ4d2+yHciQVBIhGBnYFHR?=
 =?us-ascii?Q?aeLJHRHqu0kAZwwlPzVMiUIY2M0aH/UAm1IS36WwQwplQ3vOavm8+ID48hkk?=
 =?us-ascii?Q?GiV+8/gH1azwDAWxDhCesStXLO8XS0PJgP4rAO5sas9FWG3KipXJB1rJNbJv?=
 =?us-ascii?Q?fO8bCOyQ02oEFjgU0p6aevkeOBJshgptPKrcUlsCXWgme9TbCNIWoudQQfOB?=
 =?us-ascii?Q?+QaqZXFrHQrYt56/WC5C1OfuUZ01Tr6rjAdLL0xiUHUU2WpVpyLH4v5Sqsfw?=
 =?us-ascii?Q?1RxO4LZJ+TxY+WMZJ7B6Dk8HP+Ukyym94oQdGVx8xANk000iXlsb9UB7bGhL?=
 =?us-ascii?Q?Nb9Dpa9EzoTxAiED+NhjLQkCjOK7hZldXJ8h1u/TX54P2MGx/c2De15fPpcQ?=
 =?us-ascii?Q?U7pLFVlpbjmEoWjz0Qlt15En0g1+g9u/L3tDyGSFNid+MNo0LTA6Ud4m8NgX?=
 =?us-ascii?Q?oFcLsEYsr99kPrVphuUNcYUQi6SSvgE/JYmIS6IbvqcigRV4t7oxM6b5tV9y?=
 =?us-ascii?Q?ZGMVYSXN+PHTJjALk7phnhtt6un/iO5LiF2tas6CshnlTEYiGE5w6x3W0eZV?=
 =?us-ascii?Q?fiSmWVoeV8Ilyl/EtPB5sOYa71BHcBJZPr9l3oHmpu2Cd09KAKmg7a7zf5Ni?=
 =?us-ascii?Q?qEr2DxsDFW2AdxlsFBGtbWMimumgm5rjHPh6hy5zlcLrzVfRhxJSoQKGfdP0?=
 =?us-ascii?Q?X4pad0QjwJW+JHsBJyyEle7YAu7AFw8RDiEkReBZCqHpM5sT7/lCpWX8gCBM?=
 =?us-ascii?Q?RtrB1x0peM5eAN0DNIw+yPy5mX9NNbrQwKFmh0DU9WkcjDl9sqMQG0EJN8TX?=
 =?us-ascii?Q?KN12gvGae8lU4ubBTOXMpDQYO+Wn0YN4Lngmy2UmC+DhPhTxYrUIZ+fa62Yn?=
 =?us-ascii?Q?+0YXZzFtsGBH+pFcuCJBq0DqqAQL0744BqKywj7C4UNUGcSw2rT8z+HOjnQu?=
 =?us-ascii?Q?8L4C9iGOvUybTdsROM3vH/xZGfSsOvqUBDhOT708yBiBCb29o6dLGOKrori6?=
 =?us-ascii?Q?GavCLtOzQ5snI9rn6u5PD9cxnmrV49lFOn6x7VK84s+31zxge7qcIEGDhTiC?=
 =?us-ascii?Q?4QmJVUCM584gzfnaLiPo2X6uLlNloAmku/MY6ZJI2cffr9BCpM4iimL1dw30?=
 =?us-ascii?Q?MwvjCo+HjR+j6sWmi7RgJIr8kQJLFatjz0su2+vjYyofXEyvbLnmJ8/syZFP?=
 =?us-ascii?Q?mNEZp93CQMYsQ5VXw6A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96064be2-451f-487f-94a5-08de37fea629
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:13:18.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hJf0B79x5Stkf/by+Z4ryQYTQr3ra4E8qDj5M0ZycdN32q836ZRlp2gzHwlEVEQJ7wPxhyry7Ga8XD5fT53Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_071322_359955_87E2AD43 
X-CRM114-Status: GOOD (  37.92  )
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

On Wed, Dec 10, 2025 at 11:17:43AM +0200, Adrian Hunter wrote:
> On 09/12/2025 19:10, Frank Li wrote:
> > On Tue, Dec 09, 2025 at 01:51:03PM +0200, Adrian Hunter wrote:
> >> A MIPI I3C Host Controller with the Multi-Bus Instance capability supports
> >> multiple I3C Buses (up to 15), with one instance of the HCI Register Set
> >> and one instance of I3C Bus Controller Logic for each I3C Bus, in a single
> >> hardware function (e.g. PCIe B/D/F).
> >>
> >> Convert to a Multifunction driver and create an MFD cell for each instance.
> >> Create a separate platform device for each instance.  Use platform_data to
> >> pass the instance's register set start address.
> >>
> >> MIPI I3C specification defines an Extended Capability to hold the offset
> >> of each instance register set.  However parsing to find that information is
> >> relatively complicated compared with just including it in the driver data.
> >> Do that for now.
> >>
> >> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> >> ---
> >>  drivers/i3c/master/Kconfig                    |   1 +
> >>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 180 +++++++++++++-----
> >>  2 files changed, 131 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> >> index 82cf330778d5..2609f2b18e0a 100644
> >> --- a/drivers/i3c/master/Kconfig
> >> +++ b/drivers/i3c/master/Kconfig
> >> @@ -69,6 +69,7 @@ config MIPI_I3C_HCI_PCI
> >>  	tristate "MIPI I3C Host Controller Interface PCI support"
> >>  	depends on MIPI_I3C_HCI
> >>  	depends on PCI
> >> +	select MFD_CORE
> >>  	help
> >>  	  Support for MIPI I3C Host Controller Interface compatible hardware
> >>  	  on the PCI bus.
> >> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> index ccaec5d3d248..145f9adadf75 100644
> >> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> >> @@ -12,27 +12,43 @@
> >>  #include <linux/idr.h>
> >>  #include <linux/iopoll.h>
> >>  #include <linux/kernel.h>
> >> +#include <linux/mfd/core.h>
> >>  #include <linux/module.h>
> >>  #include <linux/pci.h>
> >> +#include <linux/platform_data/mipi-i3c-hci.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_qos.h>
> >>
> >> +/*
> >> + * There can up to 15 instances, but implementations have at most 2 at this
> >> + * time.
> >> + */
> >> +#define INST_MAX 2
> >> +
> >> +struct mipi_i3c_hci_pci_instance {
> >> +	int dev_id;
> >> +	u32 offset;
> >> +};
> >> +
> >>  struct mipi_i3c_hci_pci {
> >>  	struct pci_dev *pci;
> >> -	struct platform_device *pdev;
> >> +	void __iomem *base;
> >>  	const struct mipi_i3c_hci_pci_info *info;
> >> +	struct mipi_i3c_hci_pci_instance instances[INST_MAX];
> >>  	void *private;
> >>  };
> >>
> >>  struct mipi_i3c_hci_pci_info {
> >> +	struct mipi_i3c_hci_platform_data pdata;
> >>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> >>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> >> +	u32 instance_offset[INST_MAX - 1]; /* Excludes instance at offset 0 */
> >
> > what difference with mipi_i3c_hci_pci_instance: offset?
>
> The instance at offset 0 is mandatory and so is not listed in
> driver data.

I think unified it should be simple.

>
> >
> >> +	int instance_count;
> >>  };
> >>
> >>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >>
> >>  #define INTEL_PRIV_OFFSET		0x2b0
> >> -#define INTEL_PRIV_SIZE			0x28
> >>  #define INTEL_RESETS			0x04
> >>  #define INTEL_RESETS_RESET		BIT(0)
> >>  #define INTEL_RESETS_RESET_DONE		BIT(1)
> >> @@ -143,19 +159,12 @@ static void intel_reset(void __iomem *priv)
> >>  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> >>  }
> >>
> >> -static void __iomem *intel_priv(struct pci_dev *pci)
> >> -{
> >> -	resource_size_t base = pci_resource_start(pci, 0);
> >> -
> >> -	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
> >> -}
> >> -
> >>  static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
> >>  {
> >>  	struct intel_host *host = devm_kzalloc(&hci->pci->dev, sizeof(*host), GFP_KERNEL);
> >> -	void __iomem *priv = intel_priv(hci->pci);
> >> +	void __iomem *priv = hci->base + INTEL_PRIV_OFFSET;
> >
> > Does need lock if mult instance to access this MMIO space? Especial enable
> > disable irq, which generally use read modify write pattern.
>
> No, the MIPI I3C register sets are separate.
>
> >
> >>
> >> -	if (!host || !priv)
> >> +	if (!host)
> >>  		return -ENOMEM;
> >>
> >>  	dma_set_mask_and_coherent(&hci->pci->dev, DMA_BIT_MASK(64));
> >> @@ -187,12 +196,106 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
> >>  static const struct mipi_i3c_hci_pci_info dflt_info = {
> >>  };
> >>
> >> +static void mipi_i3c_hci_pci_init_ids(struct mipi_i3c_hci_pci *hci)
> >> +{
> >> +	/* 0 is a valid id, so set unallocated ids to -1 */
> >> +	for (int i = 0; i < INST_MAX; i++)
> >> +		hci->instances[i].dev_id = -1;
> >> +}
> >> +
> >> +static void mipi_i3c_hci_pci_free_ids(struct mipi_i3c_hci_pci *hci)
> >> +{
> >> +	/* ida_free() ignores negative ids */
> >> +	for (int i = 0; i < INST_MAX; i++)
> >> +		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
> >> +
> >> +	mipi_i3c_hci_pci_init_ids(hci);
> >> +}
> >> +
> >> +static int mipi_i3c_hci_pci_alloc_ids(struct mipi_i3c_hci_pci *hci, int nr)
> >> +{
> >> +	int dev_id;
> >> +
> >> +	mipi_i3c_hci_pci_init_ids(hci);
> >> +
> >> +	for (int i = 0; i < nr; i++) {
> >> +		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> >> +		if (dev_id < 0)
> >> +			goto err_free_ids;
> >> +		hci->instances[i].dev_id = dev_id;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_free_ids:
> >> +	mipi_i3c_hci_pci_free_ids(hci);
> >> +	return -ENOMEM;
> >> +}
> >
> > Feel like above logic have some complex, add nr in mipi_i3c_hci_pci.
> > INST_MAX can be 15.
> >
> > mipi_i3c_hci_pci_free_ids(hci)
> > {
> > 	for (int i = 0; i < hci->nr; i++)
> > 		ida_free(&mipi_i3c_hci_pci_ida, hci->instances[i].dev_id);
> > }
> >
> > mipi_i3c_hci_pci_alloc_ids(hci, nr)
> > {
> > 	for (int i = 0; i < nr; i++) {
> > 		dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> > 		if (dev_id) < 0)
> > 			goto err_free_ids;
> >
> > 		hci->nr = i;
> > 	}
> >
> > 	return 0;
> >
> > err_free_ids:
> > 	mipi_i3c_hci_pci_free_ids(hci)
> > 	return --ENOMEM;
> > }
> >
> >> +
> >> +struct mipi_i3c_hci_pci_cell_data {
> >> +	struct mipi_i3c_hci_platform_data pdata;
> >> +	struct resource res;
> >> +};
> >> +
> >> +static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
> >> +					struct mipi_i3c_hci_pci_cell_data *data,
> >> +					struct mfd_cell *cell)
> >> +{
> >> +	u32 offset = idx ? hci->info->instance_offset[idx - 1] : 0;
> >
> > When idx is 1, copy from instance_offset[0] ?
> >
> > when idx is 0, offset is 0, so hci->instances[0].offset = offset;
> > so hci->instances[0].offset is 0.
> >
> > then hci->instances[1].offset will be 0?
>
> There is 1 mandatory instance at offset 0.  Other instances, if
> there are any, can be listed in driver data instance_offset[].

If put instance 0 into instances[], code logic should be simple.

>
> >
> >> +
> >> +	hci->instances[idx].offset = offset;
> >> +
> >> +	data->pdata = hci->info->pdata;
> >> +	data->pdata.base_regs = hci->base + offset;
> >> +
> >> +	data->res = DEFINE_RES_IRQ(0);
> >> +
> >> +	cell->name = "mipi-i3c-hci";
> >> +	cell->id = hci->instances[idx].dev_id;
> >> +	cell->platform_data = &data->pdata;
> >> +	cell->pdata_size = sizeof(data->pdata);
> >> +	cell->num_resources = 1;
> >> +	cell->resources = &data->res;
> >> +}
> >> +
...
> >>
> >> -	pci_set_drvdata(pci, hci);
> >> -
> >
> > Is it simple if
> >
> > 	for (int i = 0; i < nr; i++)
> > 		platform_device_register_data(hci->pdev, data, ..., i);
>
> mfd is simpler because the cell contains all needed information and
> mfd handles removing devices if one device creation fails.
>
> >
> > Generally, mfd is used for difference kind devices. Do you know any exiting
> > code use for create multi instance?
>
> There are examples of mfds with multiple instances of the same
> kind of device:
> 	drivers/mfd/88pm860x-core.c	bk_devs[]
> 	drivers/mfd/da9052-core.c	da9052_subdev_info[]
>
> Don't see any reason why there have to be different kinds of
> devices.

Okay, can you create a patch first to convert to mfd from
platform_device_add() even just one devices.

Than add more instance for it.

>
> >
> > Frank
> >
> >
> >>  	return 0;
> >>
> >>  err_exit:
> >>  	if (hci->info->exit)
> >>  		hci->info->exit(hci);
> >> -err:
> >> -	platform_device_put(hci->pdev);
> >> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >>  	return ret;
> >>  }
> >>
> >>  static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
> >>  {
> >>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
> >> -	struct platform_device *pdev = hci->pdev;
> >> -	int dev_id = pdev->id;
> >>
> >>  	if (hci->info->exit)
> >>  		hci->info->exit(hci);
> >>
> >> -	platform_device_unregister(pdev);
> >> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
> >> +	mfd_remove_devices(&pci->dev);
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
