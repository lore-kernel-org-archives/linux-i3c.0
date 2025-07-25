Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F8C87FCE
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaK7lgshnDSyeu5PRITwoIJ6LtQJl3QI/uSiiWBT//A=; b=IP6+W55Z8qm6xq
	KflFT0e1vdKLipohVItCTHJ3QNFH3AKsQ3ryZsXSKgGvPagpFVuwRifgMbBVZqGZXLdSDeeS6+nn/
	0iuutRQTi82x9HWwLQCZHXfpqW1zT3iyUZH19arq6rB8bPChi7NUqNRQ759EXs2sgXspDHnrV8TJW
	fdB+AVHWsg99c12ZPtBnDf85vNe1tJ4JFebkC55CWcLjdt/KYEzhMFyHCAqzrAOIxZQl5jaLNuM6q
	jcE4MXNqYE22rcjSMbJAbOnu8JACmEtSC/tpCNzydGsqjofofIQyHMuSm0x6rk6ylB7MxgN4EE1u5
	JfZpOtXtpVxMQ6t8s75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIVF-00000009uds-29HC;
	Fri, 25 Jul 2025 13:30:25 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufITR-00000009uNw-3L1U
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 13:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J54pWHlN4c3afRUE1FMjAf/gqoCd4b4FNXzwZNom623nTCgRVSfifqSTwWdZsXu6jgx3r3K1UVMxEnjC2uGHm28/qrzmkgxNIEjTk9z7TyvsIc6hvWdzCezPFpv64GAVfGdJi5XEgW0w1ZVUJb0PYWLHG2GE/AIt7mVUY8z6Cn1hUcphXSf+a1F5XE2vpHTDoer6v9bAtqj2sZ0aN2PAR8j7RYPanEnnzHEW4RT1I3vRILfGqJs1Q4dkXeiyqNur8jVS1qZY7PCvQMEihlzYR+HW9ioCNFtXTaEdAgVyK3VCw6cVJ2DJS0AViE8gbClUUfqbXfkYNr+WAzPrHsnspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OmgQjNKhOeY5FqL3CFXp9cm9unhLDzSNZebQhRLdb0=;
 b=w7Gq6E7A38gEfK4o6y5eYXlKnlZlLC/sYerFCnDh/tC4sAkP1ZyGaEmrRSds77lPSvw0yp1OyALW5F2pxl3os+QaVQosU7JvM4ECl+TtmAcufUFZibmSOHIFktQMDhmFL4mTA+1volFwUWsAEIpQ0WD6vjUXaeBLwKR1pzF2Xf5jAIywke0lpMQQJS796Z+VHjA7w1ey5XEPWVMFL7dOmh6I9Pep90gR9HHX0sIC6JHM7SgxYjjVHyIIciKtlmEVJlSwTw803Od90QTTPDEaU+CukE5TLYQ8Ok7jIZ46+u2gVw+WGTTeZIdo6Ydj7eU82eLPiXbgC79/8I4r2+iqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OmgQjNKhOeY5FqL3CFXp9cm9unhLDzSNZebQhRLdb0=;
 b=mBe5qZk6uqNumrOUhQ/ARMAs4vE77kT0YjKoVP9J5Gf+ThIrwg1gwPe6H+25whIJwSU1JDher703I+0C1pEUFzGqzlcAwgyt+KRdCoYVlwJrQh8Sg9646B6x5c9rK3aeiUbXNCOJVCFhcbWVV0GfPJOiEqef031r8OgyhFrlrwkLc4wkfHQ9/hGLphMRvGQ1L8jMf9Q6xkt6UOXb8F3cMhHmV3arj1JFWHCh+Yo1UK7lbIj+ZM0BmXHnyylzrthm0Ni68YKqEaua+2v9F6KnXqAfl75KSUfWJDlEQJ7rk+qiVCI0G2UMnSU11IEevp8owbDrp50V43iMqqiSZXlLqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 13:28:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 13:28:20 +0000
Date: Fri, 25 Jul 2025 09:28:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix module_i3c_i2c_driver() with I3C=n
Message-ID: <aIOGa1ILK9ySlzQS@lizhi-Precision-Tower-5810>
References: <20250725090609.2456262-1-arnd@kernel.org>
 <8cf89734-0663-4453-a079-8bdf40625746@roeck-us.net>
Content-Disposition: inline
In-Reply-To: <8cf89734-0663-4453-a079-8bdf40625746@roeck-us.net>
X-ClientProxiedBy: PH7PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:510:339::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 976fcc9a-8942-474b-74d6-08ddcb7f1f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HZ0hIxi0OxhBAvas4GYNP0BL5r2bmecaj7QV88tEFjTkzZbCgdubQlMi+CTz?=
 =?us-ascii?Q?hB2NGoNL1M4ygwEqzNSyfyBAF9sPQkgnVPn4aTyoiZL4n/yI2f9OpPz6bVjB?=
 =?us-ascii?Q?0IZQc2o8nbwr3Mi0UX1YFiYtPypww8bmBHl2NorHIKc2J1Ek7osYqxfZq7Y3?=
 =?us-ascii?Q?Hur3ZknG5vNi3SDOWEkucU/n9qW1FGpzQ/kZRQfleAar5m7cCpmZ6j4AvCLZ?=
 =?us-ascii?Q?nvD1Ve8ulhHH9xq0HZqgKd7gDgPfrTP0g54ZRAB251MHql21GvN/y3wEG9TE?=
 =?us-ascii?Q?dC1J66mWWE5KaA2q1yaXUvKxtw0eHBd0n78HRBqrgzYrpn9STudAIKNzcGsq?=
 =?us-ascii?Q?9rRpoW0GjYRerTtXftGx9wW+kpTdi3L1otnMCKnNTvrHfh3s43DWiX79PV1b?=
 =?us-ascii?Q?ocCj/x9bEw1cYyb5NJXg798X5EjUsYLLT1Wsa08986HCdOKId+eo+jUfuyX4?=
 =?us-ascii?Q?IvDTNs+cXfyFm+koyWYQ2qlgED+SAOJ7TaQLZ/5SlSFWvNbBIYUKdNJCVZeN?=
 =?us-ascii?Q?amf4ynU7BNzVDtdSS2HICdVRktAKBfS5OYssxT5lZ6BEvWRQp6aUZg1nrsxn?=
 =?us-ascii?Q?cZwK4N5mDVJ8I7x/74TvCpv9KdgNQU0SSXQuaDP4fQrLlTybY2tZ4W8S3rpP?=
 =?us-ascii?Q?zWfJvXJi07HPXCsnDXHuV2t2C/z4yvOHI9IhkP38xwZ9AwhFQha70O0p4uwl?=
 =?us-ascii?Q?NjuHsdwmxXDFLOgLYU2zG3/+u8U1YMoxB4NppKSb1qiBCAH4zakHThwXQ4eC?=
 =?us-ascii?Q?0AivOoNHRY5gG6fT/ZXcRPW0V4FVm3LOGx3jnzm/m4pA6vSfDLys4RJF9gER?=
 =?us-ascii?Q?2z1mkxBasvMPm9J0qQsTZxAOAar1K67Cx7mvX/tI7UgwzaQm5KI9rQQi5ALp?=
 =?us-ascii?Q?Nu0mNRvY5nuond26NdVMMmcdDdH2nIY7yl7pDnWXVOrZtqlTG2N00lePxJ4l?=
 =?us-ascii?Q?Ck8frQ7WtCqq/y/sy8GJAB3qjUP7kuwfY4U3eMd2VFPZj5sn5M8mWPU+nCMw?=
 =?us-ascii?Q?VdHcYYmdQbftaSxIY0XQTSodQEnF9o4eqfwVmFEJlbAOx074pAdvH8aLCf+Y?=
 =?us-ascii?Q?9N2xPIc0yAUfCwgHHTX08q2TnQunV0ohBejCmogx6lR0KtkGIBuBHwnu/sQD?=
 =?us-ascii?Q?J6bZhL90sM7xExJGtUXjYEXUY6nlWOUcWllgwEJ0iOEUZTk3vij8ZcCuY2iT?=
 =?us-ascii?Q?yDiDOV5SsCmTUG9/N70uTi6s3pHgEt8YV5ZiE8euFWQaFXElOKaSNhHPu9Yt?=
 =?us-ascii?Q?k7wR2Ex+ctlahMBh7dLu7fdsrBKYSFdW8TNRMgnOKyzlFaD1n0/5QMCzRReb?=
 =?us-ascii?Q?uRcgtiACDNT5SVSzLV6bOs5ZxiR8hjF0713DvTlgWExHKjIVZEOsIkR6ny0e?=
 =?us-ascii?Q?5Lp+I7dWX2uXA7RifO/VOZjhNy8szys7BUPKeE23bMHMfZKcbDhzi1QrXwVA?=
 =?us-ascii?Q?hFTU3Q63g8BlH0O3oE63e2H9PYCXewTEZOGEsdVE8xkJIwH6e5UpwX3EmXp7?=
 =?us-ascii?Q?hgM0C3gf3lw9mkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ftpUfwn859HC0lJceHOdBiofSZqD+sf+x2wj1Lj4BPNrbzcroSB6OFDTCR/?=
 =?us-ascii?Q?Hsr2eprzsJDk8DJyxApVc+5sBmUB3aIRmB3gp/qWVmUi0FXbMuwv4MaVYDQU?=
 =?us-ascii?Q?kaUIwkwLaL104udS8/X5cot8OTqU84AzhHKQVYg63pVhM4uPoIeZr+NRCNw0?=
 =?us-ascii?Q?cKCna604BYWLkk0Ajbe+FGwCJMmYPuLqz3lm8aUBszWeh4Ui+j6JOyjMifVt?=
 =?us-ascii?Q?N2G8i4IknN3Y29R58Ix+C5g0ppRzxkLE33L+bq+4jAE6gi9FOpQXq1/KjCBn?=
 =?us-ascii?Q?eVpyCMS2t87f6NgKBVz5FOcmBv4Ei4/TmluNrfS2IHxlNrxEiOH9AXo4rU4h?=
 =?us-ascii?Q?SL0lzYs3+nxrG6Q//Z8/bPLgGgTaiIXgoX1JEb1OhB+AELfFtolCIP9WeLC4?=
 =?us-ascii?Q?osKlB/q8ZL/vTKhZU6erqMGztthA/XDaFpUqfnLa8utmX2fG98VV+6fYpdPR?=
 =?us-ascii?Q?I6rB7coMzCSKcbLfUzwXWzayeLi4YMHABQCsQyWwq7zED5pEcyrKZWC/Cnsq?=
 =?us-ascii?Q?54lX0G4csOSA12acqYTN+LKNGn0WZXMolSzK49/QM+KH65Aue2x81xPgF1LX?=
 =?us-ascii?Q?8S85dPjArZB37aggfCYtcN3jxlgMkUUjnv8EqB2HKWWQe2w7JVBj6PN6jnvZ?=
 =?us-ascii?Q?WPMyliRAuvgSwtJ+Kh+Bg8CizjhC6QSm6moPCi1oigjClc+LdbbcXILiXwWH?=
 =?us-ascii?Q?sPIJDXw38FiNAK/lWMyFXqcspN8RLf6NxuRBeCmKlxcx0RcAFPSZEObOPb6B?=
 =?us-ascii?Q?DxJXfbrl70NW1XgbwhXR/TPaBOPKRrpTrYGal4jZmSY+Noqklcs639IG9VcG?=
 =?us-ascii?Q?jy7WpykBclasDdE38yAqpmP+AZSGrX49AHWzw+bhb2+0RrwgmYAnKeVF3Qjd?=
 =?us-ascii?Q?iwgk2ESY6uqIqWzAMm//PTIoriEww1AXK2YE4Obs2DkSpuB0Cbz4Uv0JIHdt?=
 =?us-ascii?Q?SzAFVxjqRDDXqx6JzJfY6pmiA4g1Acf528km7pbNgMeCkTOJ6GJY5XDo4sPN?=
 =?us-ascii?Q?0ehOEN483StNetRCt+UrboPPMY5k5lI/YoKM5SetQnIcTeYViptc7kTUSQcH?=
 =?us-ascii?Q?y2etmNw14BCkngnZDeIRN01wfqhRL2LNfQh6QXlzwvUVTu6NOYVMPm/g0MWC?=
 =?us-ascii?Q?F2bZpdW5Fe2G+xzZsDIaKUo+w+G1gxaXVugyxUBUMnPDgGWisQjH0Y6Zw8Gl?=
 =?us-ascii?Q?gAbrBqC9PTlk3oEH31OCjWXKTXgo5ENWDg0Ewyiru2VIUEfrvTzlOGEp4u+d?=
 =?us-ascii?Q?78OzCwh5QRE4ckqZTBPZpTj46KLprUHLbyVwEh4pY+4OnPrHXzi2sqpfL8Ur?=
 =?us-ascii?Q?fF0Vblv7w6ptG1uRtVH8NAFgFfkY0ldYVqLhpYwwqPq6/RgmTCYLXgD2uHM1?=
 =?us-ascii?Q?vcZa9H1qSKabUpNzwqFzNZy6682q+OSGq57SLsQHB/vrTcCvulmsrg06ZCTj?=
 =?us-ascii?Q?EA1iIAYC8PJhKCYTFU1BVvFE7pRsut2/EgBJyi0jtSTxMqZ9J9vQumcrvl4p?=
 =?us-ascii?Q?tT8F3tQqa/QtNhrlr5wVO0a7uJ9i5odxISmMkmcFzSaYuMXZKPfZEKCloaMg?=
 =?us-ascii?Q?TYWG/pLV9824aVZ+xjYY5eerzaHWJKSdLVOGiVCe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976fcc9a-8942-474b-74d6-08ddcb7f1f11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:28:20.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz/xEbzsBnmXKcl+wgnaxqLzVK7Eo6xKHyPimL3SP/DnyBGyPid/65rM3h3SD0Dd8qN43GDWhVfjMlhVXg1XxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_062833_861751_9B8104BA 
X-CRM114-Status: GOOD (  25.87  )
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

On Fri, Jul 25, 2025 at 02:19:19AM -0700, Guenter Roeck wrote:
> On 7/25/25 02:06, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When CONFIG_I3C is disabled and the i3c_i2c_driver_register() happens
> > to not be inlined, any driver calling it still references the i3c_driver
> > instance, which then causes a link failure:
> >
> > x86_64-linux-ld: drivers/hwmon/lm75.o: in function `lm75_i3c_reg_read':
> > lm75.c:(.text+0xc61): undefined reference to `i3cdev_to_dev'
> > x86_64-linux-ld: lm75.c:(.text+0xd25): undefined reference to `i3c_device_do_priv_xfers'
> > x86_64-linux-ld: lm75.c:(.text+0xdd8): undefined reference to `i3c_device_do_priv_xfers'
> >
> > This issue was part of the original i3c code, but only now caused problems
> > when i3c support got added to lm75.
> >
> > Change the 'inline' annotations in the header to '__always_inline' to
> > ensure that the dead-code-elimination pass in the compiler can optimize
> > it out as intended.
> >
> > Fixes: 6071d10413ff ("hwmon: (lm75) add I3C support for P3T1755")
> > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> > ---
> >   include/linux/i3c/device.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> > index b674f64d0822..7f136de4b73e 100644
> > --- a/include/linux/i3c/device.h
> > +++ b/include/linux/i3c/device.h
> > @@ -245,7 +245,7 @@ void i3c_driver_unregister(struct i3c_driver *drv);
> >    *
> >    * Return: 0 if both registrations succeeds, a negative error code otherwise.
> >    */
> > -static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> > +static __always_inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> >   					  struct i2c_driver *i2cdrv)
> >   {
> >   	int ret;
> > @@ -270,7 +270,7 @@ static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> >    * Note that when CONFIG_I3C is not enabled, this function only unregisters the
> >    * @i2cdrv.
> >    */
> > -static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
> > +static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
> >   					     struct i2c_driver *i2cdrv)
> >   {
> >   	if (IS_ENABLED(CONFIG_I3C))
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
