Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA45D3EE89
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Jan 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVvi9HmnBpRf1qmOq1rf79y7hb8f6MQYbuP/vCNmBUU=; b=EOy8+FBVQhOvWV
	kqRrj+7Sa4Dc82oIQuBmgl44GVwgfjCCkVgVykRLkzAUqBpJNaD/z9PjyK2eKxvjqUl+E5q4k/L/C
	FhGf4FAA2kE7HmnO+aGbNUkMPVOkdE1dA/SLg2nxXQbkrrm39QOqgrIWPANWKMV97/6/YmD11yea0
	tFP1YnF9lbenQFzMR/Ky5l9ch9IWCHbzdRVynZHE1LJDy9mi4hKR/y+oxBXQTlputwfjyEtTAHkrf
	qBnDL8S+xUh6k7RmP3lHYU2W2/qbS4YjxVvd7B5xvDHuMr1+GesWvb+Nc8nNlP4qPaCrBECZCHO+l
	eeZ034iJW4FTlpq75dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix7P-00000007Nb5-16Jh;
	Thu, 22 Jan 2026 16:01:11 +0000
Received: from mail-westeuropeazon11010019.outbound.protection.outlook.com ([52.101.69.19] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix7M-00000007NaZ-48ZA
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 16:01:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf3PZ9eAdApcmXx/tCSjOji46/Jm5E2aAQGHWeVxYjhQsapMNn86sQ3ZF+WHFYMytRV2nql8T/Tj3kgPeKk3BVun2cvHpbsTwizaTgOftuL4w+hqcVo8ZsMzpmF2vTKaEN4ZU6MfFXoddEg11uNRZNctwThu1tEU+cMzqia3fw+vkI+Y6OXIP3vKAfv0hzpgh2qwdFgEDHxU1qH+pu6R6rpOm1m1GJ2H2ZEQy4Tn78t+h1qg6ST88ciZ+sjOcl+T0p3F3tDM+OMDKTiXCcjR8IRID/r5/LgMTsbQr/Szg/HAV4dcamerNMgzmHkH0eQveoTRI1fn8y0oi6Bw/tQUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsdv1C9Yr0TL2ld7PI5mu0YZULFyMlUxIZRvoV14ViM=;
 b=KsdQ7Z4ns0Ar9u12LoCiGMz8PLviK/dYuEe06OUNwHkYdExlG3uoe5sv3CrRg1lBZRWWWD89FMvYyhvx4ZaIjnmwPsDBFdvykY7mQKYWKELNXXOcLCZ0EePvA5kJl4Ggt+rzMw/7lYqCG1/aTeZ8HVS/0Q+130bbK2OtwtbwrMOIhLoCLmTEDRAZgK9IUIp1+G1BUJqgNL8W/Im18tW0xGFKtInMDkE3buqjapdHO796uOxOgPRhmpK5EKk52SzeZ53seDxJTMCS4avg/7mXiq3UIFx/fSUYfemLRg5mwiD611KIVvNuEv7xmbopLRdE0nuo3thasGqH0jM3l5QCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsdv1C9Yr0TL2ld7PI5mu0YZULFyMlUxIZRvoV14ViM=;
 b=G8Jb3vnCBq5UqpKmeBxlpaMonb51PdMtOPYgsjImI+FJ56Q2I90Mt4hT97Eq8T1Ndqwn1xKcHyNklHpjQTASpLQcF79F3+rn5E7eOPFuznQMySy0zOQ7s7VhFHQ441RNAbo2KTW7OlUmBDkYhPNM7usvIytTuilQDAX+WEHYg23zdIubHq07+WZwPhE0J21yUXBOSPjsriIFFsakcBVQ+yBh7UOKmb+cRyIc/VFZK23ACQ93PDOB9daXcqQnI4UInScCz5Q1SMYdL1kWstM+H6shSD7X9YXctFnSZ3PW6Uab3eR5QsOzexcHA+rKlsIqw9r1yrDlXrtCHMnyb9Clew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by VI2PR04MB10739.eurprd04.prod.outlook.com (2603:10a6:800:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:01:01 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 16:01:01 +0000
Date: Thu, 22 Jan 2026 11:00:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Add WO sysfs option to re-DDA bus.
Message-ID: <aXJJtgtZ59ZxJC0b@lizhi-Precision-Tower-5810>
References: <20260122-i3c_rescan-v1-1-0c17071e232b@est.tech>
 <aXIdsGgHQQPKy4Ok@shikoro>
 <6b15a03c-57ae-021a-581c-4f83e58842e8@est.tech>
Content-Disposition: inline
In-Reply-To: <6b15a03c-57ae-021a-581c-4f83e58842e8@est.tech>
X-ClientProxiedBy: PH8P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::15) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|VI2PR04MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: d9427e34-4a4c-47b7-576b-08de59cf6fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ckpJOuxOllUXeH46ykWpqFZoQdJkPotRIbQr6lm/f8G2tURaYvnnrLzdVG?=
 =?iso-8859-1?Q?/h3oQv9YnwR0hX5J4N6FuiG5yt7Af7s8645Wm3M2ZIZ2/ZkLmyvrAT68JL?=
 =?iso-8859-1?Q?73g3a2uYER79G5OAOEFZX+EOUjgiavdFsWimfsYzdjU48DNfZlRs4lxpp8?=
 =?iso-8859-1?Q?CNLeYQoQKW5qmhQO1i23M1K1Ayr7jIiplH7B8eZ/xXnFw8vQ/lXO0Cq/9V?=
 =?iso-8859-1?Q?SKyMLyGtsa1CYcWUYWipqOVmsWdQimDBqeNqpGHU/1IWrTprncanU4AQdE?=
 =?iso-8859-1?Q?qygK2g+X1E+0dVt3Ew02qqjCerOdxFnIVSAMWVCgKB7UFTNm0KmeZBuNqC?=
 =?iso-8859-1?Q?biKSCknc2A65OxTM+QW7k50+0UD3YPgS6rJmKzWfmhVlXHBBY495YGAGuH?=
 =?iso-8859-1?Q?Sou1OOzr2Up++aw8Hvqa7gHyX4o8GPK5Nb7u2zuTlMxtEohxYScJk8O0zs?=
 =?iso-8859-1?Q?5IVGql8QjaEP+szu3+3TMy7U8TApChhIW7m/WX/mC84IAeTo2lWNTZEpXg?=
 =?iso-8859-1?Q?oTUfkTPq/zHlfNI+cFNJNrZecv/wlt98g5495rp0ho6tLQokAIyrpk42D/?=
 =?iso-8859-1?Q?jO6bD6wPFTtRt5rnSztpgNsMmqfLizs8/zcZWH5pQsurSp/SIYt+gW+2xO?=
 =?iso-8859-1?Q?a31Fzga51vHeYjDjoWfoo3e8usSfFGfftPsRnhW924+Oazh/+1YD0tenct?=
 =?iso-8859-1?Q?4PClO5gxXh8Rxc9Ay2PwdSXEmz2vNHbnGvMwn5HujkRgRHp6nMLXdcOPuL?=
 =?iso-8859-1?Q?4BTAAQpQ5Z0cjNNY2fgQhxJ3iw3ARisRislvaViaxNv3MeuNIj3wcyi68B?=
 =?iso-8859-1?Q?wyqeSYf/7BdAF407ZN11Pr0AAWnjWbwL6bzAuC6SkC1wnuEiS99DrQnEzD?=
 =?iso-8859-1?Q?S11YijE6manc21WgWKQRwL/PL22gJBk6vih26aJEMB+j3LTHcYFLgr/Jpg?=
 =?iso-8859-1?Q?5c77uo/Ro/VdD7Xo0IYFfCS9uQj/iFi6l5vOs2gfMA78NJrmjYfY7J35p2?=
 =?iso-8859-1?Q?ECORVe3hDnjZNtmBIGkbc5PaG77zpYWTha0+09Ho9f0PisFKUKc396IRc0?=
 =?iso-8859-1?Q?SOxOJDk9n60UbJAFnSIkvOaMhbFkT4IC7jSw66WirYzWs6OOD8o/7NtKRm?=
 =?iso-8859-1?Q?C8lSecQdtAugkZ0/M5B1Nfcmm4FSyEOD/QWhwU5+dwl+lBkHgnlrq0OFbp?=
 =?iso-8859-1?Q?4CCYz4RW+h1f8zr3m++NnEdWI9rX8Ng9XTbMWIYZ3iD3gIMacHw+9CrVQH?=
 =?iso-8859-1?Q?NDng/Ycxl0P/CttfafdJhWznj4CQK6psuOYGn340bvMoDuG6NMYuLcf4+K?=
 =?iso-8859-1?Q?mjicfa+sDdd78AIUxGSNlYxDFGNfWKYNGqRljtoDMteJUnGIJJ4OHdkMuI?=
 =?iso-8859-1?Q?cL69PxMiw/9TBrDm2ESY438iVBXfVYOuiuZlmxx+I9RO9grehHbiiKSQ8u?=
 =?iso-8859-1?Q?Rtz6vHYokvT9tMMDPHfSo6HRWftP5CW+SIi7Wx257iR4E73npvVg4GzTPT?=
 =?iso-8859-1?Q?/ioFuFflfsaLpwdi3PIXq54gsRbtB9ARkmrTcx3xH80nmIk/WcWY2Ro3B7?=
 =?iso-8859-1?Q?XvEzpD3lkArUj/U+nSF6YjvRcU3jsMohBfeVP5/3w/BTgYrIHlAUlqq7ek?=
 =?iso-8859-1?Q?AODuS3ANB8Qk6WiItP6Di2riBWNsBQgwpiHNBdZRt52sDfCbru8DVRkX8/?=
 =?iso-8859-1?Q?ZaN6dRJ7ZgN6MEyz5VQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BheJOfmp/2bd7km2vUqdjliRJuor2lHQFl7Oy5oB13rdxbgUxKqGp52XZm?=
 =?iso-8859-1?Q?ppfC4P48cJ8tQ+yAqLtvKEKa3EGsqBxMgUb5i1ALO83SZN9j8dhWFxRztG?=
 =?iso-8859-1?Q?DfQU2iw7K/EVuew5UmIjJw6K7t6SBvMIZkNp/AAdzd9tkzFTkCvbfOBzUM?=
 =?iso-8859-1?Q?ZLb+6Si1d7w/qU/FqYOO2mqJtGlM9vOghRUteMdw7pnYsuOW3kw4pTaWLh?=
 =?iso-8859-1?Q?KpWVUUmvJ2ygSdlqsdUVhzBfAw7hKSEFUc0vLd1hWnrzhZXgxRiCGVCNWg?=
 =?iso-8859-1?Q?Rw2BMnsqpdiWj50qgJFe+2WBKlajURylOxZIWL2tQ6xKyECkld8c+TlT+2?=
 =?iso-8859-1?Q?Z0MXqH/JcPY+hfKZVuhXHOwuECeNyv6eXc6+MKY8U6fQbUQQ+98wzS6tDj?=
 =?iso-8859-1?Q?zFj/FcP+WYJ6x0p3AeElGR3zNCSavxOwJeG/tTqFIfqwnqxg/PzuJMlkps?=
 =?iso-8859-1?Q?Rkl9dZJTuP49bGVbGiLOsL7D8b3Sg6LNY9GE4FBk8Ef1HyvvJg1Kvpy5dX?=
 =?iso-8859-1?Q?FeBAzCA6s3jAA1jcDpdZyaoN5IGcUvxMiP5tsURTDbC/uOcC4tcRGZ7rjx?=
 =?iso-8859-1?Q?66r3ameWq0qgliQPkeedMgLpkiNLPUieWa2aGZFNg9pfxdTIfRzakiSu5w?=
 =?iso-8859-1?Q?H5tXzvC/4KfgLX/+fQryr6lhY8TsP4ppmfceXvec8NQeChNaoIOxoOYNY7?=
 =?iso-8859-1?Q?iSZGG9ErYp6Jbgyd7CgT17jX0dCrwD1d2NNB5nUJd6ynxNuUQT7JXu5mNB?=
 =?iso-8859-1?Q?a9/LPiaGUJZFrFuIS8rV5mVsu07OvSypRZo+nciBxPTmeinRGO7k2n/ZD+?=
 =?iso-8859-1?Q?EttmCsoFGMZCpcDu3NPxfDwkylYWwHkGuIxcccc+ptBxgtkbbVO3g2taCo?=
 =?iso-8859-1?Q?ys1kWiVO9MQfMFWfWdBRsJGDI8L2TNEOK4KIqFj/lG61q3eGMTDpnl+u1X?=
 =?iso-8859-1?Q?MlBId5p87ORYcZd7eT8AJe0khR5A48TFXrZnaU5i1y3vNsI5CuRCsGqndt?=
 =?iso-8859-1?Q?iVaRQ1bBm9eGU92lJBd3+I+od7pXbaJqeuZYX7Dn54CbsJbRpfhLv/QQeM?=
 =?iso-8859-1?Q?vbLLt5UsXv2aLST0OdXWBtQi7WZ1+puzolVgZLAzmhVBCKE6NWJRashIEA?=
 =?iso-8859-1?Q?cByKxCbAjFYrkn2Ty7YDtp2E0AdP0VDqDA6Q/oQhuUYbNVZDIj3QFbSjfI?=
 =?iso-8859-1?Q?ub599sDEJLcPGhStTXw+1OcAA/E4/nTFGpy9JZ/MVwwxjLLQeAoeaxRV0j?=
 =?iso-8859-1?Q?76CxN9JVggf0w+n4g3zAnuRn7xIX+DzMwluL/YptXb50XCVnXr7ISygF3M?=
 =?iso-8859-1?Q?l5IYc7swqoq/USNytaBS53oEYAFpzXSIFXaIY33/Zn9YbxjATvf4jZ+MK3?=
 =?iso-8859-1?Q?dwUQaCSV6QitxpfOgw+rVVZEyb8qfpqI3tOQWFdu/M4gPmok4BOckn4x7v?=
 =?iso-8859-1?Q?TQxjagctvGxT+oRO5VYvrvB0C2KRuqPZd+omoU/Op60Cq+AMwNyC2YtQcb?=
 =?iso-8859-1?Q?QhV7t4Iz1b94v1w0uFhwQYts/Zl1inX/IK49f6trI3xabFJ2bfs1RhytnV?=
 =?iso-8859-1?Q?aj3D4zbJh2kQgIXlm3F9FxT2wP/F2sVAI2o8fZeUW8Kl0KXPrXOtWZiK+k?=
 =?iso-8859-1?Q?TO1z+YM7DywMxYD8PjK0P2EzzSWTbIx6nw65PQljcOdPV8MGxki8T+/6vV?=
 =?iso-8859-1?Q?nEX0pG3eDlZLjlT/6ua2CUr8kA7dQZOXE+8I4jnPLfLK8wDQ8XXN1Oe2OQ?=
 =?iso-8859-1?Q?KSTLbQfieyMMdp4IDkKJoYI30DdI11VeRkBZmLCheEmGtR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9427e34-4a4c-47b7-576b-08de59cf6fc7
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:01:01.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYqrMlxE0ef16xAUe27qXMfOs4HSW5BK3q6D34XERMJ59RnWCc4bHt8KxaKblofwkqjxMOlO73LTBXx8hVSdQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_080109_047978_EB0C8D0E 
X-CRM114-Status: GOOD (  16.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Jan 22, 2026 at 04:47:23PM +0100, David Nystr=F6m wrote:
>
> On Thu, 22 Jan 2026, Wolfram Sang wrote:
>
> > On Thu, Jan 22, 2026 at 12:36:30PM +0100, David Nystr=F6m wrote:
> > > Add ability to rescan the i3c bus from userspace, i.e. provoke a DDA.
> >
> > Your are describing what you do but what is missing is why you want the
> > change. What is the use case?
>
> The usecase would be an i3cdev userspace driver for a device with broken
> hotjoin support.
> The device requires FW loading(userspace framework) before it will respond
> to DAA, and is thus not registered during initial bus probe.
> I guess a similiar problem would apply if hot-join is bus disabled via
> sysfs, and resume hook DDA runs before i3c devices are powered up properl=
y.
>
> A bit of a niche usecase, I know.
> I found it to be usable though, but perhaps this is better placed in debu=
gfs
> in case its too much of an eyesore for the stable ABI.

It is useful. Please improve commit message.

Frank


-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
