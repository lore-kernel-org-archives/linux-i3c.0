Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C192C87FD3
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Aug 2025 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mI7ujcU9HertVco+tLMyXbOrVQB7Nq60n30YUdb24Aw=; b=XclbLaSTI2kiHO
	gQ79eiomLfd6BrCmmEKxJVxhHycBjo/3OVzGvhZvKc+U5XeLtor63JVzyHBy1wmGOYA78zJEc0+lU
	n3Rzr5PKKVCC1u69Xwhz4Z8t04umtQ2vuz2leshCgMaJXW7SOKpsEj0yA3Ns5grl0t5lXE95SIgIf
	FBGDZal+Bhe7jJhWJJFNxOpi6TY70hZE9XrEWhLaMVZX7AkRkhR3MfPqNUs0IZmX9h0h8ZkcTu9+I
	fhodC8a9nDTGtpBFnIfAvQKi967Q/tRnpBDn505QSreUzlr3+WgyqTbzsj7N17U5XqsdS+IhJsPaI
	rPUyzZf41D85b46pjTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhvK-0000000Fvee-0ppH;
	Wed, 06 Aug 2025 17:27:34 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir1R-0000000A1Z1-3Bwe
	for linux-i3c@lists.infradead.org;
	Mon, 04 Aug 2025 08:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcyEVCKe1UhGSyJu7ddDET1zu9m6uQjpBmHnnDwnqmcwNcBWVMxvE8r/fyhsDGvcxG5ZzVbfOzWyOj4HgSmkOYq2SeoEl4IXNh0V6tSYaao+qrXhZsyfCEKrJY6O4sgulk/ds/Akl0wMnZkbuoTHTwbBlODhkFSCD9greBoygsiH7PLJIk0Il64rSSdXhzVHeMSGlVUiS5zR4UXOtAjfaEU2GTcDpqo59mDMpvF41uLB40jXKxy8Lf1b7Ixtf1PWZutoPpBVkCNvXrcTIZ/OIoLzHEHWMjFfU+JNUzXflA0dRLVhwpBWnPC44WaO2I16jyCSweHEWujmSHRJYHjg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHzb/C1XwMr15rII0DoKrDqJZRAtMuHv4Pj5/4Ychf8=;
 b=cSAC5KOWkdbgoQQbOCdqy0x2lz3pKHcKT97y2rht+nc9j9SQC43zxQB4nSHA9c/8im2LjYXceT5iCoWsDbipX/0+P9sYCBYnRZnIp04wnoqLg3Rff/gecamJ6egI1XKiPYXkz1y7WeeYH/TVS2O+PyPpkTfGpu1UB03DZ1W31CxQmlOKXf6a0uJ11Fom+Rffku29xyS2pZrc9CgXwtY/hDGkmrctoOT4pMA/4MMKn0zWeIi5DtUkEhExtM6IvIs47piTfHjimiHV4SaQz7XlB6xpLGHGS20qw25lOemmMhBMJZFDYrgxeIjUJqbVRFRuqrrvd2153d4zAGHb71GpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHzb/C1XwMr15rII0DoKrDqJZRAtMuHv4Pj5/4Ychf8=;
 b=Eu1DrT+bf/QoIgoNjL20R5+WVCUuu0jkvwaOFVWdLn6Ntw7J0HU53emnP1R7gzA2mIzhsAL7VJKtaYPxBkVbfT58WtTtAbLLRpJGa8PiSf1VFgJlSxLi9JRoqicSlHCbKi9D+Bey7cUfUeYMD4INAs+S9wQ/y3PKCfv4keRdNt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB6670.jpnprd01.prod.outlook.com (2603:1096:400:9b::8)
 by OS3PR01MB9463.jpnprd01.prod.outlook.com (2603:1096:604:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Mon, 4 Aug
 2025 08:58:11 +0000
Received: from TYCPR01MB6670.jpnprd01.prod.outlook.com
 ([fe80::ac12:5df5:dde8:96b0]) by TYCPR01MB6670.jpnprd01.prod.outlook.com
 ([fe80::ac12:5df5:dde8:96b0%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 08:58:11 +0000
Date: Mon, 4 Aug 2025 10:57:55 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: renesas: Simplify return statement in
 'renesas_i3c_daa'
Message-ID: <aJB2E5wJ0gtIOy0f@tom-desktop>
References: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250803211256.18513-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To TYCPR01MB6670.jpnprd01.prod.outlook.com
 (2603:1096:400:9b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB6670:EE_|OS3PR01MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 202407d0-b2a0-4e8a-793d-08ddd33509e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e+i7l+NMZ7C+D7GZmhASONSScSPwXpwZt6le8klkxjO4IPxF+6+0F02LQC4A?=
 =?us-ascii?Q?Hj7wqE0XiwjujqNin04c1o7spAvIMlCRSwsrzdma7I9peaR40hf69P3VKwR1?=
 =?us-ascii?Q?fjVGIsTpTCGmb6X9JKV76JnLFxWe+Sa2dtLwtt+YaiukidwVTPuPz+YX6lcm?=
 =?us-ascii?Q?Ouehq+mJ8xIybHVOX4CSFEmNPiVMdSj4suqYhLIr7sTGe1qKMc5aEZsmPjVt?=
 =?us-ascii?Q?WnfTwWDGRgejju4iHVuAoTun02Ee5OzAuMOKTY/sVpLuT+42AGfz6Icm2cQP?=
 =?us-ascii?Q?E0tCpKlkp24cxVNN7TYM92qmcFQEv8NkECXivk/tbdQeu61KORxtSRXveFGc?=
 =?us-ascii?Q?m/HVq435yLCHZs/fiY9WhaDtMQAfPm4N9DYhpkzragNdnkQLwMijA3VROgFy?=
 =?us-ascii?Q?SLNEtHECVmz+rNlJ05hsi6Z2fyDVS0akvSBwum9y1fm+R3whSTmbH9V97Dqq?=
 =?us-ascii?Q?9T+AOzBool7pSzjYWpKrc0atEKyfj01BBDX2maw2lWWIA8+7Ol0hqnIuOwai?=
 =?us-ascii?Q?T29tEOMxw/98of+EMpii//uYvrSRCKLGm4FkMp722yAgGhC8sJkhVNCN4HW4?=
 =?us-ascii?Q?4Jla0XDjUcTKxxkXM/bxdpjRc0FjCCwICB1f10rpmPh1AjkA2/vkGsfUKMAe?=
 =?us-ascii?Q?vYAWjFVvYa/wiA89k9CYPIjk21QRrH6NPfgQx7owXDrH8RSV8MDe4LnCjLqD?=
 =?us-ascii?Q?UqmOPOZDOjAbG9jUCKHYAMk51ODGgZSlbad+ktKleWP6gzNP5wJslTrJ2Xt0?=
 =?us-ascii?Q?83437R1UpSKO6WoGfcCBEByjadZOs4B9WC3OHbf0BNR/FHM7ODeitiPgew4B?=
 =?us-ascii?Q?t+GpdY+W+5yK0M2BfZD54X+vZTaNarkUrkigV28ymOSWohHAMw4w6r95N4wk?=
 =?us-ascii?Q?f1J0TihqI061fH1T6D836gEQPdqrBdU/TPVIcdkNAoLTb+DsH07Z8p68jVju?=
 =?us-ascii?Q?IrKwzWq4x/fTuwXB6ulnW6Jgr7y+s6QInoXeAuD7ffqnqINDXduuZO8tL0fe?=
 =?us-ascii?Q?Gzab3pla+62bZm5BiQ0JKOYjyC8hqXwZj+56DCJsz212WaHknCX+Q17T/SU0?=
 =?us-ascii?Q?RTGBVu+LjIZPbOlfqk/KFMrHYsAh8yJF5IVMkPCzhKX2PILa2hDbKTdvbca6?=
 =?us-ascii?Q?XQHmNXoa9cGUgm/m/oUFbiJQyzqp4BUk8Btz1y8coG1JNE6+NAUPGWQKlxLn?=
 =?us-ascii?Q?ErXlRShS4pHdYNl+DejMohtxc+NAx+LTwOTDp5xr5Vmbt+hlqwfwLIrLe+Hi?=
 =?us-ascii?Q?MRi8jANulvQhV3428ZMdFMJui21k0rwtRPmHc8m0GuakBXQsjWCu2IuHIrbs?=
 =?us-ascii?Q?DZZGwwP7NlqoEJIeyvaehvLsVRJEL9AQbXoPveW5MhuXdkZUw57lxD6B1hx0?=
 =?us-ascii?Q?BjktyRj6IAheq6qZGNVW/4PEcG6qk+LuBIo5d38ta1Gy8hxLH+cbWy7zDLFQ?=
 =?us-ascii?Q?7SEXTUfHzVQjaTYfq46eZ8jGFLQ4Bon8puzjvU6BDJM/bw8LmSQnWabydW6p?=
 =?us-ascii?Q?ZlVZPKBU5lXOL08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6670.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k94To6kXhCdm5xxbY1rhO/CR6Qb8higvf1GZ4lvUWS2WdqOaepfkGyjY0/X7?=
 =?us-ascii?Q?5KUfUKromBoC39ATq2B9GPCS5tKpYtMlKYvYBYCkiy7TnauFhn5lIJUvuBgu?=
 =?us-ascii?Q?6X/hFKnvE9gcnxfF1PL1fQM+teJQ+ZB/QYJGIlSvZmTMPKx1IizIYO7kzHTb?=
 =?us-ascii?Q?1MjjyICQBi6jpZWogmHHj8ZVZeBwa137YiRQTNySOOBY+I5ZNyJDEmFY3oe8?=
 =?us-ascii?Q?Xkrdit1FuHlUqrT6AayoOXuvusMZdrLNxZs0SgNoteFd7uS9qlBXPzY4/0Ev?=
 =?us-ascii?Q?3KRqjQzuTh0culcqyTE8kq0tePaPMwtFCZq16MEHt6AgDnxiEC+CHdO5Tlbq?=
 =?us-ascii?Q?8UA5PS6aq3je89H/7PBMD1IKFR0O4b/eH7/E3XlmKbsqedsvnMnb9/HCoHk8?=
 =?us-ascii?Q?18TaQRjjQaSQn7DdHRYHWc7GjXbfNi/DgrXGRmAiVSciuQFRsQNS3qNKJ1qn?=
 =?us-ascii?Q?fk8FzUjEXqWm3yYFUxNlWvGVrw5TAgugLkE7xnjPqwI192DVUqNVZFlp/uGU?=
 =?us-ascii?Q?0B4rB3dSdLguQZlrqDwLrETKN8m8/qywXNxpobbJcAwLBu0cHghsXMdBM4hV?=
 =?us-ascii?Q?i+v1MWgkhtKvaRoVyEWfTL7XHvkIS4rfZdQLyv8Wmvw04YBvq8AU7FxzrhoL?=
 =?us-ascii?Q?FRMNZ7eJp+IZNYKntB7jF7Id1QIDPoEE77YMi9/2Q7R6VtR2MmssFRsSHlJ4?=
 =?us-ascii?Q?PL0v4HPblKIc3DOQathnTySC50WB3oyetLLXaJAenfTrdIsI+W/oIpyjXMSQ?=
 =?us-ascii?Q?suZR0y1BQY0Erm1MFeAhC8fkmit0kCFhfQi9vPcKF8CE9E4QpvI9E8YUdXaN?=
 =?us-ascii?Q?JeOQBTaGaeLMeoUKw7yp6XAJjxFP1+QaLfGLQpNYtyieyb+yHgjBf/sYCQaU?=
 =?us-ascii?Q?Emtn3tBVO3rtse2d58HsKGlsHc0A1vF7rewFt/85zoQr4h9wTiYHag4exsGL?=
 =?us-ascii?Q?z94yPAWgeWJu3qKQZcz2yNcUZ5hc86r8jTJxq8RuMsb6CizN5iHhJlyfuDyu?=
 =?us-ascii?Q?g5TWZfp3DHUwWw9WNoKXEeoxKTmXdS70xIGTIMwDRgGsExDJ+1WK7Aj+ZSZG?=
 =?us-ascii?Q?PNsE12FEK497wA3KdUfn6hmPZDJwxj0AKlWQPcsOVswrMcIsDYcKXzkk2adr?=
 =?us-ascii?Q?3Z1g8nlUrhJwR2osrmVuO41YY5GBE5SA3Iqb+z5XJumFnY4wwMw4Ctsox7Ea?=
 =?us-ascii?Q?XmeKEM7qJ5kFF/pk9AU6KWtQbuAfQpM8XDFjQ+b+TQuCLtG+ZLmzQo6tfXgl?=
 =?us-ascii?Q?oxITWsFpuY7DCPyZ6iwEV7HL48p+QjPuJNVTCKc03H+8AYg1yynCpnxMkHRC?=
 =?us-ascii?Q?eJWrKe+j7OdOW8PJEFAby8BGCKjCQ8XETMEqW3SFwhzeG5WzoV0fTSTkKUWB?=
 =?us-ascii?Q?6UpgL/rDRVSEO1EkL+jZ5fgnPlVZ8I4lRtP200PXihxhfaF8lPV5Jq5b7amE?=
 =?us-ascii?Q?OMEoCGklxb4WRoQkNuFmgJy10uJifLW4KGq40EGO86jh4kabLSrBQR40B8G8?=
 =?us-ascii?Q?/2QK7v5gff5sCiYuy7m2ToQE3FaHASSGu2slO0vsIKlD1bkhBEVo7jIbXSfG?=
 =?us-ascii?Q?c2lHansqd/oy9C0B96LDkbtdvI4kNjLAXCytdzlPbKOUbDITFCGxGvKZez+N?=
 =?us-ascii?Q?Z+erFsOixw6FsSwwJ03tr4Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202407d0-b2a0-4e8a-793d-08ddd33509e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 08:58:11.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPEs+XbCAYgn0JSq0BDu2QhX5POtSTEkYFTWTKd4qXrhsmnB9NIg96/MqslkXtwte2i3JGG/R80YyXcm1SOx03HRweOMwNp2ebWfoVNWYLlz7r3tjI7yW0yeObgOG5gG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_015822_147029_5FB8619E 
X-CRM114-Status: GOOD (  16.22  )
X-Mailman-Approved-At: Wed, 06 Aug 2025 10:23:35 -0700
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

Hi Wolfram,
Thanks for your patch!

On Sun, Aug 03, 2025 at 11:12:57PM +0200, Wolfram Sang wrote:
> There was already a bail out for 'ret < 0', so we can always return
> success at the end of the function.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/aIyzJ7HOENL1qp1l@stanley.mountain
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> ---
>  drivers/i3c/master/renesas-i3c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 174d3dc5d276..275f7b924288 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -679,7 +679,7 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
>  			i3c_master_add_i3c_dev_locked(m, i3c->addrs[pos]);
>  	}
>  
> -	return ret < 0 ? ret : 0;
> +	return 0;
>  }
>  
>  static bool renesas_i3c_supports_ccc_cmd(struct i3c_master_controller *m,
> -- 
> 2.47.2
> 
>

Thanks & Regards,
Tommaso

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
