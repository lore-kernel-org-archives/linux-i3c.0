Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD88103E2E6
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:
	Content-Type:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeaQ1cZbHx3X+3kOcc7cenaIujAAfLVaLbzgc68mX2U=; b=MG106u4yTBrkNKjBF1Cc9q5dq6
	YKyHtO5bURtQ7SgkahNRY2o7LtUNUsE/OstFBX2ikq5Must5skOx6v9f8PLa/YrkJVdrwyV+yt0Wi
	lpkJHkkAogYLPJfySxcUXTRKgkSVsgObfHwDiTa6EO1SkqdciGheJ2+C6FXfuNsEVAvWlhf1d2fYa
	fpCiEjvVwjEav5hN3nwKGLbgjcRAHtDH/lHhi6k85xusJPKWsVNVZg2qmY+tWLx8eUYrQCKzuKgIg
	3CRSq20s+MW16AcUElt5odog7xBy9vDUA26HBf4BfhYt1OyHUkS50i44UCLXEgtoXLTx/peaWuUJQ
	41qWtAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rcs-0000000CbbU-3TgJ;
	Wed, 11 Mar 2026 22:01:59 +0000
Received: from mail-francecentralazon11013008.outbound.protection.outlook.com ([40.107.162.8] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwuG-00000007Mh6-456J
	for linux-i3c@lists.infradead.org;
	Thu, 22 Jan 2026 15:47:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RniTqZE2OJJCiNomDv+FiKLy16NT2bboGselCRBPfSeabz0toxEpFYA2b9YgmHr0QQlTDnaFVZydcVVjCzr8Y8W3KLzWPbZBImB1t+Gm5kDD+8fA5ibmoX605PwZR8VuLAghHs35fKB6Vem/nzT7c28skr4zdSU6JcHuAkGuhe4Bh59Ep78wSTH2Qcd3Vnztk/bqtS+ya3QkJ1G4pJKs2Nqq6tm3/Ts2HL7S0TCXAb4q550HXzJAoK5RvYOI/lZuOF9ctN0O62gtiZE/U8M6DYHULusm4RORkyoXSPGk4VLpYa0c2+pCObCeJODTPT/V48GYcKfe+rmDLO+pwA9RBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oxEtgGvHO9oulN4bEiEjdY9ivPy0/W3UqI2Ek2Vb8s=;
 b=i3p14N8hoH+r7QbMfFPjWPAfRpmt8bV1OQp74GL+oGoau7ZhtrftCMHOqMD6EKLdz1oWExGam1qFpymkIpWQjJJKLuxUHgKXMjCBPhEQp4kukbCkyBVuuIIEA9gUhMkrKaYQyAeZtQ8L3jrkDrg4IpZF8vA9lzFeX6HbQE1eN1zMVbUfzIUnX1u17sto+ksvgxYwu+DlKF1d5CUT0HwYVDPPpvNQrfMbCLQPB8xMLpmlOtnTSK+YgYnUq2D/+Ond/45wk1DrBXmERJEGjeRaiVS/oFCcbs8+/YDhVK13khG2sOCRWb4sH+AF07e5CCUjKnO4oIUZSEtfFauAi/jfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oxEtgGvHO9oulN4bEiEjdY9ivPy0/W3UqI2Ek2Vb8s=;
 b=uFafRZiCUl8GmoutEl0fOnuKtgL1VjmBg64NESI0I4ySFuJ2ccFIU3QhmB8epTqiT6TByxqfW1r5DBEq2hEt4d919m2ITTsJ0uFB7fHDlqLuSJHWckZmG8NjKsaTTe3XQ1YLqTlhUkO3Qwq7t3e5qDuPJsQBXX5aNVl4Gu0ttYXPiVa+qFPi2myvaRZ6bUTNoO7qRk0GvJHPfwCVDCJJ+leS2IMXQsXmXkdrY3avjBgN2Y4Iz/tL8FUXVKti5dcZn6SM7+RywxwUrnkGDYj58uCOZ3ifAz8wJTjAVZVcnS41PNNN0lo81FqfCSiUizQT2uiOmattEuEl0UlgVKZUkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by GV4P189MB3136.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:28a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 15:47:28 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.20.9520.011; Thu, 22 Jan 2026
 15:47:28 +0000
Date: Thu, 22 Jan 2026 16:47:23 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
cc: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Add WO sysfs option to re-DDA bus.
In-Reply-To: <aXIdsGgHQQPKy4Ok@shikoro>
Message-ID: <6b15a03c-57ae-021a-581c-4f83e58842e8@est.tech>
References: <20260122-i3c_rescan-v1-1-0c17071e232b@est.tech> <aXIdsGgHQQPKy4Ok@shikoro>
Content-Type: multipart/mixed; BOUNDARY=8323329144045977917690881331250280
Content-ID: <800d1a37-2f65-3fa3-33dc-11d8cd13dbd2@est.tech>
X-ClientProxiedBy: GV3P280CA0103.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::8)
 To BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|GV4P189MB3136:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2b3721-a3f8-4087-01fe-08de59cd8bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-15?Q?50xNn/eREz4iENen2P0CiY3nfF6WrctHn/QuHPRPiKMpe7Ve0tdj4elUF?=
 =?iso-8859-15?Q?bVd+yhg/QU1u30x9hmWXzu/as1sgGk3UCo4YJBU0i65BN00wKriS+NGnx?=
 =?iso-8859-15?Q?f76LtC4pKzgzccwDLrXlgp4AqbYKCPHQJfy1BZ+L7/ydmvnXIWCLfQK3L?=
 =?iso-8859-15?Q?Yl7m+6SCA5Fs+MMITaEPng2qaLEZwo82Y3rgBGIh/BphtbIXOAU2pj0ap?=
 =?iso-8859-15?Q?pkfGcpZIOO8j8kq8BavVXpjInLn8mC+HsXLkwyjMAg8Rp5XlRkN/Rvq9N?=
 =?iso-8859-15?Q?aYnnfSoZKmaHHiuFJi3Idhj1+baBIIw/4/LbHuI2ENbeNN6Jr4Q9125Qf?=
 =?iso-8859-15?Q?e/S5zJCFYdBJTkgR4Zl+FKgnVd+nUWf9SSq9giEraWdgooCQ/+/ADN1so?=
 =?iso-8859-15?Q?gAoVGMBgjynKJpQ87IpLY3MLeSnONWh9+iFMnoYeW57dWVzAfgjxYxKKh?=
 =?iso-8859-15?Q?ihyXNI9vye4GDHdwYp+KasxWlm71zSItxpVUjNOqRiT0eQEQCQNCy9RNj?=
 =?iso-8859-15?Q?KYTETcDD9CadzTFB10Hy4oZ5G1w3oeV1VwR4vdFvnKy/OpsEWt+L9ZyON?=
 =?iso-8859-15?Q?ixrDMnGRdhv8i87jXrSPDg/IHkdGXvOt4fS6CF0ToGwa1fV5oagczKbwM?=
 =?iso-8859-15?Q?tB+7JXboUO5yIMeKYaOHKMk5ZBFUgdGqp8h6idSqHlkoACh5CGNysNSbX?=
 =?iso-8859-15?Q?YiDntUT5lzNwpa6TczwKMevHOwrx7PwhPNyExc8MiThjy6PaFHbow0Low?=
 =?iso-8859-15?Q?JtvKa8AVEnSRq4GLH6+PAEtoLTG//nbbegB4VHJz9y6VD44ONEzqIkVft?=
 =?iso-8859-15?Q?dqNSonJNtnd8dF9YtlTBKMr1yLeO+qUxTDa1+26ec4zdd3y7cJcs8Uex/?=
 =?iso-8859-15?Q?XV9BG+nINpqtJBrShXEoVf+7LZgMjam5UdIxa1VGDUnSv6SP6WbLeScii?=
 =?iso-8859-15?Q?vO9LeWYuxnsgZqm9sjpXONDO8WQ8oGqopHVgKZeuBfauImfT2f7E3/zog?=
 =?iso-8859-15?Q?yH8yv3uboA8zwNPN7xPeHUW+G/d/kTL8HENIybPLfiNHvicycKPrWV7zW?=
 =?iso-8859-15?Q?u52XKvNCPe7ZE3Co/ov7hOAKFPfxFAxWg04XQ7351nGbLsjI1C9ruPOT+?=
 =?iso-8859-15?Q?WNJN+1y1OmlVBM50PLXnZS5omybQjpGKUY0btpIzL+nwg5BZgn+MU4//X?=
 =?iso-8859-15?Q?Wpc8Nd1JXHHoxsvT6G9g9Vlff7bQEkV+kKIyS5dBczK0IPUJSa2Fx7OJ1?=
 =?iso-8859-15?Q?Jbu71FlwsN5NzkEaGixJgVCWNrHk7fWI1HU2BRfdouUaoePL/qrYIT9vu?=
 =?iso-8859-15?Q?4KjX5oiPXvUcoLNI4KCMmtBgwjWTUL534UMjy40flPbS5AFLHnXGyrYVR?=
 =?iso-8859-15?Q?ElZEABz6mlw4fpvYyj5mlZ9DRg9wD4HiZYkaLQBp141PhVjSAUZdSfOlX?=
 =?iso-8859-15?Q?8zpwlw2VExDgBBPloEA6nxOAr6x5Fn6hTE+MaJz6qmRXdT4aQ+7S+M/R2?=
 =?iso-8859-15?Q?8ynEfVKGjyzMHpKgEBH8Za32h/c5Vvt7svnWet+SPWCbDDi2u1SJEjAOV?=
 =?iso-8859-15?Q?wMR4P+SFBZR+CBmJ7A/1QUUPkwgoj8Md2529wAzR74wtDEi8Ps6wGPWRd?=
 =?iso-8859-15?Q?qD/fy03+KQkUIzb8DYhYOq1jXBW1mYMlUlvY505M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-15?Q?po5VsSaGwT/Q/YqjagN5aznzQq65qxwp/fwJBtX7liQZXuHorpkZ2sadg?=
 =?iso-8859-15?Q?QFx+0+umH71csADudTE4zLRNN9oBU2XW8JrxJS5LHD4JrpDKU4s7zWfl1?=
 =?iso-8859-15?Q?jS1LClDGrgPF24sxqefcxAAwrW2+jhpK0v7UmJfFu6TFRpT2NrTCGTZbr?=
 =?iso-8859-15?Q?WFpbqh4jsdK6u7iAPofwVB2n1sXTBMGT6A2FFguitDF6e+0KS/hLFpC9S?=
 =?iso-8859-15?Q?KqMP7PegvDhJvKJ64yWkZbABSaeBD8JyMJ4jfmRwpTlRLdSXNp9Ieg/kR?=
 =?iso-8859-15?Q?sUC7udEjDqF882y7lYy2ri6+rimTqzR1I+b3qZWoj+MnvXDqI//IJ8u1H?=
 =?iso-8859-15?Q?RuQjWePGeg3NOjLZFYUgsrZba526Z6fdu2bBeMl7WuCK6OGfMbIz3cX5z?=
 =?iso-8859-15?Q?JozVVdS7q0JLgIf6dhbF/ZVNjJYnI7bd+WGYJO5BlTWryaKDZ3T41U/HH?=
 =?iso-8859-15?Q?xxtGpFJxuBjBximPk1do81V4W4JQk08LoqhzjeviQjMNXUsa92S4OnR5j?=
 =?iso-8859-15?Q?a2O2uvljbNfziZ9i6twNap+/GLCyVHgNcffk0zpuFKqC9vUQWRbp6dfey?=
 =?iso-8859-15?Q?D9a+6iscFwNf+0LGf3J5MUrOOBc6yV4zFe4aXd7nT09AKBtU5LXs2Wvax?=
 =?iso-8859-15?Q?w1hDBJVP3q7wEWpxPBosLHbc8XfDhWk6fztTGXDE66zLAnQhfR0MGsoF2?=
 =?iso-8859-15?Q?t6w1Jo3ydyUz/jZjkO3/A1IkE3A2hqzLQlGmh6SGY5TLT1lz0tIKJSqOn?=
 =?iso-8859-15?Q?ZbdK/5pdsG7dAoDFWiipSfgQk9j+919RVCfKw/Imw0YWr0m+33Mi1fmF/?=
 =?iso-8859-15?Q?MHpDLjYdrUseSBpWinKCRm4QF5c39nOaxFh3UOVDWNYrWE61r/Jf6V49g?=
 =?iso-8859-15?Q?gXuDAf50zTFTbrbv7mtE6gnMC1BPXVZmpn1NtRxOXkyNYY5Qrc9tH+rA2?=
 =?iso-8859-15?Q?9tvEPnlS1o3hQ7kYybNIsIgLy+mkszSzzr9seGxZNq4sdTNW3hzcxar1R?=
 =?iso-8859-15?Q?w4tieuLVNxVWnIZAzWoWeFcSHJkGoiC0fI4vDys1htnrA8YyJ85RlHsbU?=
 =?iso-8859-15?Q?97tMGaECSXl3j2gAxT9eIjaU5WdvcRd1Aai0SQ6wliTxGfsptj+v99xaE?=
 =?iso-8859-15?Q?VybvhaLGxkzWMmTCfKXhLL0iU+BsmmjTdtrCWwolfdD/lxQejcUxR2sAH?=
 =?iso-8859-15?Q?WB/a7vV/y3Pfqze9LfM4ddzzCiHGNuOhP39/DNKkwmhT/Hurr+b9t/+GX?=
 =?iso-8859-15?Q?N9fR0J7tHNff7tyP5Lhfgj9TE90XwfcYWm6ieMQ/fzGV1m0Z6WwHfD4rr?=
 =?iso-8859-15?Q?KBsCAV/c2HTup0CATjTW6Q4+1605VQTWrvspgHgl6in3h30G1H9EAVV4i?=
 =?iso-8859-15?Q?yZLgR1aa7FFDpGX4I7LS2lAYnxuho9CBRpDjx99YFhlhFcYefNMCvLXLr?=
 =?iso-8859-15?Q?3yYArv2n6YJhfujiw6RU87Pb+DoAANNLiJyq8/d0vRX7xm0HAPQpXLRTT?=
 =?iso-8859-15?Q?nLr+VHa7f5JkNzCiZOXITG4+sOYX34zjztaST3MaW9qSnjzIEFkSKuoLB?=
 =?iso-8859-15?Q?H+v74lX1cckCHA7II0bCRywuq4PdtD+ydNDZDg7ijSRBtcQI2106Jxw8p?=
 =?iso-8859-15?Q?vWAy/veBDjdauPET2jYBzkN/ZWs6GaZifefvV/+s569N8WzBVZl2j9mhQ?=
 =?iso-8859-15?Q?2MMXCXjee0oACIWcBmtfFyaEsKgRQe7KJ/zIgbwfI1UUOwdaOm7keEInN?=
 =?iso-8859-15?Q?WdngkPH1C7qRMEmCMvyoCfq4tS4IKDsxJT/6T5ToS9qSj6MKLZNILwxvE?=
 =?iso-8859-15?Q?r24iCLuoGWibgX7GgFx0xEbmb4WP0mIUUEbuI7NA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2b3721-a3f8-4087-01fe-08de59cd8bc3
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:47:28.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QsEALPJKO8uQc0SY8ppj1VO8qE4RZnWvaKC3SDWll5rMATg68HO3CgdClU2edWXGbmWy11pCqySkzm9m6OwSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_074738_011014_49612E7C 
X-CRM114-Status: GOOD (  10.09  )
X-Mailman-Approved-At: Wed, 11 Mar 2026 15:01:57 -0700
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
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

--8323329144045977917690881331250280
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b007b23f-258c-af84-c76e-3f6003b5dd83@est.tech>


On Thu, 22 Jan 2026, Wolfram Sang wrote:

> On Thu, Jan 22, 2026 at 12:36:30PM +0100, David Nystr=F6m wrote:
>> Add ability to rescan the i3c bus from userspace, i.e. provoke a DDA.
>
> Your are describing what you do but what is missing is why you want the
> change. What is the use case?

The usecase would be an i3cdev userspace driver for a device with=20
broken hotjoin support.
The device requires FW loading(userspace framework) before it will respond=
=20
to DAA, and is thus not registered during initial bus probe.
I guess a similiar problem would apply if hot-join is bus disabled=20
via sysfs, and resume hook DDA runs before i3c devices are powered up prope=
rly.

A bit of a niche usecase, I know.
I found it to be usable though, but perhaps this is better placed in=20
debugfs in case its too much of an eyesore for the stable ABI.=

--8323329144045977917690881331250280
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--8323329144045977917690881331250280--

