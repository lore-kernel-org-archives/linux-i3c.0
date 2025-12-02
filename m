Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8AD11715
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSSq0neLJBDOqJM5mvH97ovEwoQYsdtt0p4lNg2wDuk=; b=jmBLp/I5jaeU3H
	uWvsfd0BfTHK5OsWYM/b+uoscBKDJxHY55iVhqjXX1sK8Hs41AdmngAcqSYQ9wvQFT7hAbAiPuzZt
	0HrkZ99TARPhvHJDQSZ4RIzRvBeVbU1svdg6Mb7cj7D4ik9DYP/cZhrcBLmI2YsWovKZN/1z4xVrq
	hV9UEDjZVDlDP9QZEufN6KcI9hIMC5vJQtBpTZZUIPNoYqJwfBUdkpUmjTahnZS3NI+3jksIwr4IL
	6nFcvF7LyMNCSGyTOuw1JiFDJDcrf6GFWTfcbCjI4HrZPjU5CoB9UANDyMSfxq/PryeFj47OEMLcL
	eQZBLXg0ug+PV1V6jmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTYQ-00000005dYT-2BEM;
	Tue, 02 Dec 2025 16:48:42 +0000
Received: from mail-swedencentralazon11013038.outbound.protection.outlook.com ([52.101.83.38] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTYO-00000005dXf-1Ek1
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 16:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX27PZqWJ6TVrZzht8LALyqB3buk/y5wE0cSU0X7jCFmICkL/IRMxer8IWOwYIbbRCvMctMQYYieCs/izC907Xlucvx73Fcq8o8GxbwFNlXzRXs3FJ/cgAsqAfvsF4cfYLTCiXpnoX1wgJ8K77BDUWMAPNedxLU2pGdNEkekURdwlAyUPbxeigOEEamnUhsZboSNyOXvH7zNEdYNGimUE/SZcg1NpYcWtwaY9Vedrd/Lwj3mmfsqrrUzzgbdYgVArUGrMYew1hDCAbPd0u/QvG5XJiXju+8Hzh3Wsv3KMNPSBe+cHoI/baRbQz0oxXh/Ti05LeSGkZ892gIz2bPE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BThVn/elXgmrlTRs7Rj4b2x45YjbV+Qhrbm3QwOMBmg=;
 b=k+dZ0ZHYxVl9tXxvkNnjvXvqxYtRZ+Mmk8M6+OMZpSnEWyBZ+iHeyT0b4CzqEdOozfXDRimkj9AOhc+RAmCTzZ8IwV3k3a7VMo7oriViNlljZCtjEVFzbZ8GrLJ9k4q3I3BhkLO149poNMjaSg7IodtoZlhtmnUYw5S05UKNYOvn9sKiYqwKdRN/Ivqu0hXcCCneUCuNJDRenx+pEjcWfQavjWpZ98XgV1/t6N23OD+gLJhONZAjb2yHUVrKSDZG1rNSiOoxKzfvr94/ZuaYrFzdy22/soM654BAnO9OeqhgwhpS7mD0R/Is6XfWMuS5BDeHw/pRLdxl9Kc23y1XPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BThVn/elXgmrlTRs7Rj4b2x45YjbV+Qhrbm3QwOMBmg=;
 b=a+aYzhHfiIGCcWx645gYgl4Cug6g0kiG3pV+LiRlyZ7R8LtxddDJhemDpYZ1qp+YdTQcrIoVeZ065VBnKEzMXl8ian/gFed92g5PlGP25aDelJG0mL2cuVx9mZ6tZm9fZGNxTQWaSEAeK0dasvPIqZ+jpeR6S3XbIy4BEiRjcji+wA1N56qjz8/oTSYRvHg11/MY6j6A5s+Oijlb6hEIdSzswbOD94bd4rn+RBwTNX+9odI+2/hr9oBfBkhfZHQT5L/0Uy9nbOCINA4MZ8b5UR1yQKA0TVO5XF4/Wqc7j10g9iR9t+5h4NHd9UiSo79HD8mUEF6c2pz7yJOatq9Gzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9802.eurprd04.prod.outlook.com (2603:10a6:150:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:48:31 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:48:30 +0000
Date: Tue, 2 Dec 2025 11:48:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: document i3c_xfers
Message-ID: <aS8YVyiKZOSZq7+g@lizhi-Precision-Tower-5810>
References: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
 <20251202153804.2640623-2-alexandre.belloni@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20251202153804.2640623-2-alexandre.belloni@bootlin.com>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 338ea146-265d-4406-faa8-08de31c29fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oVdDxI3uOJpQTo/AuTH4CO2O8vCpmXQUpcccwncMjqxDxCFGNcg97oNG93Z9?=
 =?us-ascii?Q?DpdVdh0dB9TKXlbqT3r+OB8R3GCFzcHT0wmn+1M1G1IVdcQYK6Fl3xh1k9Uj?=
 =?us-ascii?Q?J0fORbhQ0BoPZj2qYjIMA1jmCrqY3Ro0jpMBCs4HXN7j0aYwN+pnbUqwFInw?=
 =?us-ascii?Q?NH8pBe1fqS2lrYc2u0vSqwRRgwfTXpygBzprl8WvLbJ8w6VtaX5jxnD5EheB?=
 =?us-ascii?Q?nFYOwU29wwPODzm0ExoRGN7o/KiL9eVDZMde8a1YUlrY+SOVmjZ4u5aPflyg?=
 =?us-ascii?Q?WFv0BV3F9MWI4MWJa93/r/B/s1WRD5c1ehbc2yyCH+kOe96UWYVq0U8YyaUn?=
 =?us-ascii?Q?Hmy3wT0gCZFNzgrcWidvQ5iiiNmWUyaDoXArC0c8Z9X2ELazoA9L7MaouZUW?=
 =?us-ascii?Q?lFGIa5L0IoTXY1cZl2e8GJkWY9sZWPflO7tSMXyMr4xJYDfMI/hE96RD3yYS?=
 =?us-ascii?Q?+vkfhm4VOZcCuecNEIK89wNcX4mvTrV4iXqKqIodUcvMqsLLVHW1pJvLFwLN?=
 =?us-ascii?Q?bRnttYgv3KlGxwjQnQGXHCJ/FEXF/n+0zq6zGfYlrGMN9+9YtnzHJ1E5U5EE?=
 =?us-ascii?Q?7Z32MadyikHfhFgejQpVkV+1rfb1qnNAWjUYFNMmc1G78C4eyXluE3s+/Hj8?=
 =?us-ascii?Q?4LR7LQF3MOKZGg9M54mIKVI2+h++POYITOH+9kgwZAuSFxO/8d0C8+eNPjp2?=
 =?us-ascii?Q?8i9woeTf1tf612P/5doE9G5Pb8cm0JYHKQdxLJCnBs8oSp+xwiiUxHuiXXeQ?=
 =?us-ascii?Q?18ZuJcIXlma+c8f9At3sNmm9P15XrYJKQRCNTNUd48buV4bRL92p9cYdQKqk?=
 =?us-ascii?Q?Y4kKwreXaPWtvbLqCrSgfdywM2xihWwb+zDfFAsEozKGpR5DSIx1Yg2k8tJ5?=
 =?us-ascii?Q?aG4ec4kiMvBbIkXRva5ScTBMraqV6WAQy7y6BdlURrZrhPkD6zh/f+HRLD3M?=
 =?us-ascii?Q?knNhKl4hSnXkOtlU3SKEOtUhExE9vGtPuEtUhvIfdyp3grzpMhBG1iuHNtMy?=
 =?us-ascii?Q?RWT1ktNzFGymcU8ZGDJaQV3BOW8b0z38zMj9PwDqUaWg2mouFHS3TejkSDNS?=
 =?us-ascii?Q?ZPoe/e1E+PKJ3inKJxx+A8K7W3FGLW6ks+LTYSRHix9esBmlF3/4dDW7Yubo?=
 =?us-ascii?Q?Qtpd+icooTUEjb2koEMwqN8rmV5KBd9NAGw/l7PI1JZ5Kp7hOIeFfCRvXs8b?=
 =?us-ascii?Q?YRrkaO24Rn2biC6Ew3JjCgQZmhFoXWGoFeAMJfSWJasJMUn5V9lDTdmj0lkr?=
 =?us-ascii?Q?u5UgxJQoXHvXYN/oB93kA1c2Ze0GjXK0inyzDLlwCPZNQOi8tHaIAE/TD+qq?=
 =?us-ascii?Q?LemKtCsII19TBBiAyjCu+2X7uyIV8AuIaSlD9cY0NL1jWI6gukEbyt6cdqLp?=
 =?us-ascii?Q?VWrJQviaAlmdUF2BQsrJmANgTEDuIvuKX5WGFtbWGBMy6zpVqv92JzVVkB3X?=
 =?us-ascii?Q?DimPPTKwqC8o7stGrE+7gTn5wL1ebgA6jybqzn9jVcPRw0IAGe+eCQ5lGARb?=
 =?us-ascii?Q?czPYK1Auu5g1g1Lk7PP+3A9xlp6vGDNxlgF1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNkAJCyJfs0vcYzSBeBUzh+Y5woZeT3+ogDx0KbEB4Vix6jlkJu7EsmcvIfi?=
 =?us-ascii?Q?1HvbY9U4SbFfnmwP8yv7sfM9YDTelKE3hKJOnFDroNEtHT7czY7hpqIKf5u9?=
 =?us-ascii?Q?CIiYh2OUHDWxlhiNos5xZVcKSwn0oYllV8PCSyi6pQKdP8mIBpCTjdNssZ8l?=
 =?us-ascii?Q?JjiCyjXzkrznkHlsuOgvt5RDGoOC81pFDAy2c6gB74ShfLFFQ7O2EOQCgeLv?=
 =?us-ascii?Q?8RF87hrWqkV3nQU/pKUNcewp7HVMHkQDZMEV8wxwfVok3jRDvybIzgO9fStj?=
 =?us-ascii?Q?wSqx6ZUB0O3olOj6QpUOrZbmKuDX6WclS6DKYl/2JHbXtMqp3DPiBEIMHSk8?=
 =?us-ascii?Q?BcO6YuNHwU5eaufZ/g6Yvc3czXyliI+vdPt0fWCO4tznqoo92NiW+99cdoz+?=
 =?us-ascii?Q?FsZJ+oP3+SS57ZZEXsRmCLtBEnCBVRv9FM/z3XYbgr5lswqxyNDwnhbL6itk?=
 =?us-ascii?Q?1Gj/SpeP8r0+IaEQagW+7ruNvbR3pjBknqoQ90w+kPS00EzbJ9YG7Kc44ZEy?=
 =?us-ascii?Q?cugzrhNdUXHC5nNx5qkpG2eDz/S4KJ5OXssG2aUeyE8u1AbTa2wjAQg0tftJ?=
 =?us-ascii?Q?YEgEM2dK3zVxV+drOCbeSDCGqELeOFNsWYbqTlJP56pnE7OBl+iahL30+ukF?=
 =?us-ascii?Q?AEOutUTKBqkiec/ht+2LxltV0rjnQjXsil4sfXaMxTqjBX5pnDiaAxuGw+li?=
 =?us-ascii?Q?5tcbzNipClALe1U74hNtO3fKhffuLyY/LFlDVQScN+vMAuSOQmCjtWEkWtpW?=
 =?us-ascii?Q?mmZCRifzMT0ifPJ0u51OcM1fvoXVVF/GUceh/1d8RNMxOvPVFJEmqEuA7+/x?=
 =?us-ascii?Q?CWnhtuxyJGKDVnjhXmrpLzyQG63RafivnwK2agr9QG8ckIYo8GkcKvDDmCLy?=
 =?us-ascii?Q?q+pyZM1Cvz3RTLJ+GrUDGxkw3/hAzjqkIOrn6WONsZmnkoelEGfftPJixAcl?=
 =?us-ascii?Q?gIDdR9B8/XplF2aj7r3aHl2Mf3gMQeIWVT8fUgFjjlK61e4oUlYmguknpvku?=
 =?us-ascii?Q?x7pJvLf5vnmET7egBjK1WX7wvV2X0vUE/520/dTZRmbcYEVovU0GZOieGenA?=
 =?us-ascii?Q?DEf4SRaAIJBCHQxNN9WfG2oMlWpq4Hh53kpXDfWBM0M38LtYN5X99N9FhHDY?=
 =?us-ascii?Q?bMnRkG35Fkwfyv9LSGu0f349if0s7h1/1Hwi3bAbgu0kqb0L2hXA1xuGl1f0?=
 =?us-ascii?Q?RC4NXBK+BCvGVozd5sLcxyIP6pG6ui259PMA+7/ctpCeEPtr61a1FOp8mLqS?=
 =?us-ascii?Q?cWwRWsAgt4Me+QVfGL2/bb0pvkz9reLoxc5x3YWNkLsp2AueK8Znj/1DEJTU?=
 =?us-ascii?Q?ARXKhKAskU7WQiGJ46C/bkb/oq21nm4rgTERMENWqi+LaS8coFq3MbnRzcox?=
 =?us-ascii?Q?Bqai2yakMa0nAXG4RwDA/Hv2cfxIfxc9PjXuCWogMP87CJa9ujsVCrTVfJSV?=
 =?us-ascii?Q?22RY8oFdshZnyZhZscYubXjylioLNQHyo+3L71q1W1EUJc31iFRByjfuVATV?=
 =?us-ascii?Q?P+SrYpNIWO5G1v4wBTES85ozvBDT6NK52w8JB4nlsypmIjW4hp7q4Zs+h6EZ?=
 =?us-ascii?Q?D6mxfeYa5/aZCeIXqesiCtJ6rSE0gbP4u0QvXTxl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338ea146-265d-4406-faa8-08de31c29fcb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:48:30.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1eikauy2E00aB0RzFhw/HdDH9PNJeXuTyozckSZmF9SZJFzYxODVAL0RKUFUDnBMnvsa7Lf81Z8K9fjl9bZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_084840_333470_074AD4F0 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Dec 02, 2025 at 04:38:03PM +0100, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> i3c_xfers was left undocumented, document it.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/linux/i3c/master.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index d0d5b3a9049f..2fd850f4678b 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -418,7 +418,11 @@ struct i3c_bus {
>   * @send_ccc_cmd: send a CCC command
>   *		  This method is mandatory.
>   * @priv_xfers: do one or several private I3C SDR transfers
> - *		This method is mandatory.
> + *		This method is mandatory when i3c_xfers is not implemented. It
> + *		is deprecated.
> + * @i3c_xfers: do one or several I3C SDR or HDR transfers
> + *	       This method is mandatory when priv_xfers is not implemented but
> + *	       should be implemented instead of priv_xfers.
>   * @attach_i2c_dev: called every time an I2C device is attached to the bus.
>   *		    This is a good place to attach master controller specific
>   *		    data to I2C devices.
> --
> 2.52.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
