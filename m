Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F6D7879F
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLu1pP4XzrZI2s4jVTYRh+rMdlBnmqDBZtutPc5uQTw=; b=xAPWcWhkVvQ8ZU
	X2rfJkm89PH6NZAIrachr7mlPmM1qJrockK2e6+K2pQjICAuEhE1nIa7ws9KOASHyPL7HenjF2gDU
	n3TGoQ15ct0p78OoH2Cr7znOnTXdKCGeJu26rUW54Uk0lrWtawqBOtVCa+3xWyYdxs2zbYt8FiM8s
	q9clDYeSV3K1H3424x7PButetWR9fLXG6ar4eqIgyBetiL601vsTUykxeXuIl9AVYOfbNNWllviir
	1/faHk2OZw1RawJM6S1c/Xq8DjTIAU/b/czDvFDmjCNUml0zAEPjzEM4JrNgD7BN39MZe9X7SYD41
	SuVSfzpjXxwe8Cg2nfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdfM-0000000AfYK-2wiL;
	Fri, 19 Dec 2025 16:49:20 +0000
Received: from mail-westeuropeazon11013061.outbound.protection.outlook.com ([52.101.72.61] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdfK-0000000AfXR-3KOC
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cepbg6CPujRQBV/Sqy+QWYKTY+IQW6CqLG6dOPQSbGlBc6nqZQ5FUrYEe0azw5O6ACJYgof9nxwPankK4w2fwjcfRZg+Q/PlOiNsV2o/ost4dprilto+Or1FWFm7zPTaO+qeloHgH0uq8Twlitr6Afya4wsx7uNQx1jrp2Dv26akc3/dgUwhM6+YBUUGT3lme8Aqh4/ehLyRtebzU+tLy4cAIrWtgsxQN9t8OBxDxzbKfmSNJrbAqwsJCjGiwuc9VfGwzQ0Qr+ZLwSOPMVwiyIzCLsZDMUus3bLe92BQzrV519heSy95uWMTyIWe6mPZx7HhUsO9BTKlwsGZjorbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAEWOB8xVdP7I1YraFF4cm9WtQPbDeQGK8riXRK8Yp4=;
 b=IwQwnbqbOtkDDXq/8Jpj4CBIApOknCEHYT//WrpmJnfqUjY3KcR38nmyvh+7TtGbEi6cBIFf8E1HLlTSLklKmt9Rn+pECL8i/gvER36QkEqXx75OBJBr9POy82L5ywiuYtZDukRxCoXMrwNdYV/ri6MqnS+EzAApnbJVb+2YpdWs9p3dQDt+tw754SsE+9tbh0ukIcXvm/9qYVdgxmlzUBTjMHXIeXp9TOhxl+Ms7YB48c4Aahjuf5nL5a+SLAk+JY5ADX8pGJK4z5W+AyQKOC+GczGqJ86P8+ddM8+f2Np0dBaGLE+kQwqY/XeuSh+mZTbqNdOURrtXJrGZ+m9zMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAEWOB8xVdP7I1YraFF4cm9WtQPbDeQGK8riXRK8Yp4=;
 b=Y+K2xKRuwNL/n9xTjGifmih8eDtV7w5JJpeffvPpnWsWDmJ6ruSsRcO/TyxLWsdvxt3tSu/CKzHy921IwMLSlZ+bIsLhgfF3Im9Ma8+ZnR/c2ZUouw6QeWm+NYbVCL+nFjaDrSMnlvS5s2k6SFNvkX+0Pkeo9utWsDprntAw6IVDzbEBvmiFmYxG1filje9llCPdPwXINjFX9TLZX7zvFH78SKkFzN8wEW9brkf7BL7Ed5MW6/amqTPPji2s+n6O00IBgSwuqI0XqYIzwiHJw2wK1mdH/9z3Lp/m5xORCKbANeitKvN68JYnT4szvy0vxI7aM1zJHDQI9c/52d7I+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:49:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:49:15 +0000
Date: Fri, 19 Dec 2025 11:49:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 14/17] i3c: mipi-i3c-hci: Factor out software reset into
 helper
Message-ID: <aUWCBL3aZbutDQK5@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-15-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-15-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c22c39-7603-486b-9522-08de3f1e8ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WdfTB16y7PpxGjaS0M2B791zVNqKxhh5b0OOTOUC9+BC0nGzKuc2qh9Cv//j?=
 =?us-ascii?Q?SzFcbe2unVJPN1G6lK0h3du5jWCImsN6L2p16PjmEr60zhVybGFf1T/u8bwX?=
 =?us-ascii?Q?brhEDthoDvyVZgiABrAHVh4w8vZucnZ/RcgK6Qo61e5XXI8nDbWIonom3dOk?=
 =?us-ascii?Q?dIwNRoPmo0183bsDhNg29lvgBj1K83txCkKR8NRCe8ZOUgI06tB4bDTVCgx2?=
 =?us-ascii?Q?BAZLXzfyJ9PCPvWrOhvv7NeDhYtDUepWHotIuljk0KqC2blLZMIQjAHqPLEE?=
 =?us-ascii?Q?jtHQXcKKQz+JyuKalixhKkzge95k/dZX8PhUy4CZAKdUtEt3uayFNwMZ/O1e?=
 =?us-ascii?Q?WERZA6DIdC+88mdpwtx1OTGzKWo7hoGAYbm6q996/MEFQVEw4fLw9uWIbdnj?=
 =?us-ascii?Q?IpdpfTrDMlf22CgsbY5fCt2gss4sBtxbIWLYhbksUrIvcDelzNVgKTBv++p2?=
 =?us-ascii?Q?BOaqzPe3DH3Ogpgx7HYylZMVDn/HMbB5jQITUyvdt1YnrADTn7T2BAKQEJrq?=
 =?us-ascii?Q?TfT0FbHyTPM4kDl4aAiG2DfswGsCXMZEDwsCFMi4/75ckUaGiiWSTE+kEXtz?=
 =?us-ascii?Q?bzZCYNNsMZzmBaXqNzX4HOrgpiLe5N7xV68wvhNaawEQPkMBhDUm5EL4k/hq?=
 =?us-ascii?Q?5TxgZQ/4TJ7zcwI1VnVSJ4rhgcuw92C4GYp+KiQqpzjVlCsLErk0NFnMTuDR?=
 =?us-ascii?Q?qRo15iqgk4yVpo+WASaE9gqjTXATS182Xk61ISE5yMrPv99pgV5M1nAcbJJg?=
 =?us-ascii?Q?FvoOw0sbaBaQqBfYXBhetkFz3VJTEinMbN3oGxLrVNhR2nQY/CMKDwnR6UI6?=
 =?us-ascii?Q?fzdnKrR6k8rk+3jlasmROPR9eAJ8R/szWrQlZNWpaAgrGTZxl+4xuDBB6ruS?=
 =?us-ascii?Q?EiUnnk5KgSbx6q4w2qA7Wv9v3y7ijxtoPaDsuxOOLsER6F1PDK/a0c3hiwd+?=
 =?us-ascii?Q?0fgJlMWOf1u24S6EF6M2ogB0gAzimSUHrhRuIBz+nhY4rZYc4pjs3xeCp8Aj?=
 =?us-ascii?Q?ZifkioObjdRfUBevo7/GCD/L3MEqKaYOUQhGNzG/2rYkdENkfuXg9eGko/IC?=
 =?us-ascii?Q?LhiIlKnUk/oQaB5IjiaxBr1o2rmMNr02/g3HFKUVIeaQai12vWwpcs4Az3Yu?=
 =?us-ascii?Q?amNgv85SqDlkM31iH4eQDMNLYgOUOvzHwKVjIORNnYVKTNUo13ZsQ36TOYcj?=
 =?us-ascii?Q?QcyGAXvn2/Lc5QxrZF7xgwP+dVMtvAh18QUPVEZaj60/aygNvHfg/xooD3eb?=
 =?us-ascii?Q?KVhUOfpLmrFqQyQwjkVGmh+obv9wfLmw8/Ss9tpxAOuoNlWEcuNTJgk1A+cl?=
 =?us-ascii?Q?BIGcMJjdhW6lw6E/XINgZ6iifaKte3ZZHOKzBdcKPgM1sttNIWlsujqLDpc9?=
 =?us-ascii?Q?IQJun6hKuo+iSnD0F/IJPyW+2kUoCKLTKjCACyb2qaSrgLYQ/qKR7mDvLCwb?=
 =?us-ascii?Q?bJja8vWy9OWBzuaiLGAEbadEyQgUd/1zFAlmOyGRl7MRMuuW0zVzK0WkCtY2?=
 =?us-ascii?Q?o7bSd02MtLyEwGZQ6dxeNibamC4hlhNG6yiS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhmpgZ6mytu1DyAI/b5/0aaKKWTBNvTmkwXK76xhB+WJD3YvnBwrPI/c419S?=
 =?us-ascii?Q?g+hiaGAobljHWDYwiZA3lV5NiczXIJUfrfO57ThyIJXFgBC+Vo9UMS1fUncg?=
 =?us-ascii?Q?fBBu7JbA1APoEuwaBzjsIbdVNMpI9Ye+wGi7qUperb1C+7hk92bd4nEwOxWg?=
 =?us-ascii?Q?+bwsK5r1P9MXJjwEYDgWSiqwSIgclVFqsAR2F4JbacS19l1RBdS0xK4h6Ylu?=
 =?us-ascii?Q?D3vfo1y4O9egKB3EVoYNGHTjLFSoLIBIEvIhMK1lR0bWPvv9R4jDownwvrdA?=
 =?us-ascii?Q?IC0MXz7ya8UaseVQ4YxttFGLzpb8ebM/LI9zIpM4Jf1KrBcw/Y8/gKMhWuea?=
 =?us-ascii?Q?imO5ZHYWglNq2y1a2GhDXYS0m5W3xsCqTDpTJpZ4aPb7oVZDHeF76F/zynuK?=
 =?us-ascii?Q?70YIqWEZGp6SaIkm+PjXG/FGRZbZ/veXQIU3eUjZIWwmmW6OEYnObxhZaTHC?=
 =?us-ascii?Q?6Os9GQnrLGakiZttcJvyE2MN8IL7uiTVDbk7SoD+ZxfHchg5PY6QdAGNN/RN?=
 =?us-ascii?Q?13bHrVQ5b8QZ533/TamzbQsX5xpxxm4tV13FiteBHd1IucU81SrUOqT0oRGU?=
 =?us-ascii?Q?66T2sC7y9w76DYtxbHV/uyFIzuMDEZ6DJaENO+3NuqsU5LzLaVCEngYR1oj4?=
 =?us-ascii?Q?HyqiMzPSVB2MyaAJkkIuK07hwSP4LCsUZCbmKzk/zeZkR4P7U0bl1D/1TMeB?=
 =?us-ascii?Q?urHwI7d6+0EuSMyr0Q/cz6Bt9Av2M5gZk6VORJdRkAW/3t+ZonsiblerLk9G?=
 =?us-ascii?Q?+o8ciDF6xqUBzWZmGdvbhaQrAqp+FH+at5XCEGgdVaPb3YsouHEl9oWAD37B?=
 =?us-ascii?Q?gbss+0lZcQfz47/ZRj1GaUvYu8993azEubfPJIrHwUiqjceoWiHfTykHQuBw?=
 =?us-ascii?Q?WkqDJ9D7/3/i46wS3Ls66JMUWWTikhuuSoEN7jkFlODCyRC3e3F8C/PkXNAr?=
 =?us-ascii?Q?aDUCWZlZwTJZQIGdrQhTtq9X3J3ety0Wljoei5WHMD5dt62hsimqj9t38QuO?=
 =?us-ascii?Q?5AzVqbtlrpB3us2kQcdCd+G4bBmNUL8dfq0Ytbtsygwyq/7bgBDutY80Xomr?=
 =?us-ascii?Q?252C3ytV34OS+yu/aRLkCwQco+YQq6K7DEfP1iFigXvl7BDjFVdr8jNG4cPN?=
 =?us-ascii?Q?PoEHvoAb+1KCDmATM257X2i5FL8oNPthVeOCqir3jFo/H/86prFHMIEbA4+Y?=
 =?us-ascii?Q?GBWqvY75okFZGvstvvp4THTrgMC99Ndl9QFYZAqANQuQcnSBluYs13vISl1G?=
 =?us-ascii?Q?sYBaSK76jd9vuTgymSvPBjfIv8zzS/1W4fQ4h2nl2ZcVUXzsqhCpZC/eEQf/?=
 =?us-ascii?Q?7eLWFjvWfV71CHN9hC1WFEAZLbDHULmMNdeoNpfNyVKlzEbeqMW5DRjTaZAd?=
 =?us-ascii?Q?TwgA2eFzWbz99nN7CkHmudIo8I6VzH7AbutFpplyjDHSyysDPzA65P0d6FbV?=
 =?us-ascii?Q?2T3k2CXytdTpUrqn86D4X3rJFk113Bi+W8Miur4F0WDKTSrZKc2Wpv81Kaf7?=
 =?us-ascii?Q?mf15KHiTjFTJYcJFl5RTC/+iD4ZMpRNRk2US/bM4ExQX2MOrCSSXcwaveYvY?=
 =?us-ascii?Q?Vo6eLp7u3Kr1vkqiZnjFa16GGr13PIG+xDutLdaG3C5y33+D/WcIT3hWKPJr?=
 =?us-ascii?Q?0991fhqan0iS+o6+D7f2KjhtU17GPvycBt8ZcxRAMymq5hg3dLzEVvm3y/MI?=
 =?us-ascii?Q?Ho+9dhiRWCgnrk56hb3lm2lJlkh68zcSItY8HV5hgNu/j5sw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c22c39-7603-486b-9522-08de3f1e8ada
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:49:15.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdH/8WM5QyaihuWsNCK/wjbthG4WKkzpBdaBCmsfShHzZePpfdcP9Ii9y2uRhy5eAk0UrumB3ZM7pHu7H8qmXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_084918_842465_FF9BDE6A 
X-CRM114-Status: GOOD (  20.79  )
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

On Fri, Dec 19, 2025 at 04:45:31PM +0200, Adrian Hunter wrote:
> Prepare for future reuse of the reset sequence in other contexts, such as
> power management.  Move the software reset logic from i3c_hci_init() into a
> dedicated helper function, i3c_hci_software_reset().

Add sentense about add error message when timeout happen.

Frank

>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 41 ++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index c4b249fde764..3b0609cb7da7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -585,6 +585,34 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	return result;
>  }
>
> +static int i3c_hci_software_reset(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	/*
> +	 * SOFT_RST must be clear before we write to it.
> +	 * Then we must wait until it clears again.
> +	 */
> +	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> +				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(&hci->master.dev, "%s: Software reset stuck\n", __func__);
> +		return ret;
> +	}
> +
> +	reg_write(RESET_CONTROL, SOFT_RST);
> +
> +	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> +				 !(regval & SOFT_RST), 0, 10 * USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(&hci->master.dev, "%s: Software reset failed\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords, mode_selector;
> @@ -654,18 +682,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return ret;
>
> -	/*
> -	 * Now let's reset the hardware.
> -	 * SOFT_RST must be clear before we write to it.
> -	 * Then we must wait until it clears again.
> -	 */
> -	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> -				 !(regval & SOFT_RST), 1, 10000);
> -	if (ret)
> -		return -ENXIO;
> -	reg_write(RESET_CONTROL, SOFT_RST);
> -	ret = readx_poll_timeout(reg_read, RESET_CONTROL, regval,
> -				 !(regval & SOFT_RST), 1, 10000);
> +	ret = i3c_hci_software_reset(hci);
>  	if (ret)
>  		return -ENXIO;
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
