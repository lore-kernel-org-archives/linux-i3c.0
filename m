Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC63DC5CFC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVUXLTR5mF2ntDmPOdcj4Haz+YmYKsLbzMTu/qEPdHo=; b=D1YznTaCL/fjTp
	i6+3SQyf0omHFyEt/2/SPaJVmhqniiECkgbhXnbZ8+L9bDKPfPX4CaA4dqOPpj7k9EUJD4NEN+eFU
	jId4lrZ27KsMFnZalMFJ8teIZTlwinm0lpYyyKqEohN2pZDoOJpF9AEy1hUOGwWB0Rl3AGJfchrtt
	LJQ1hVkajj8UvRGWmjhXwdgj9maqlqMIkBzCqFSLtowVV9k2b2ml+BQkCMMstth4bCgF6VZ9o7ymM
	Np+dAj1qqIcVeJFJjYATK+V67d8UfgZFiQknTR65qb85y85E5k+yzCLruClEVyUY9EGfx3I0qmsoG
	zYrN1/odXGQY2iqmNwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvGQ-00000002x1E-1ez7;
	Fri, 14 Aug 2026 17:00:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvGN-00000002x0k-4AOi
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 17:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz3SwmtuoYyJwf7vRosoQIb1Kyr5nDGYlEsIqLy/8ihP3QXuTLeDZ2fUwcx1NMFmgIXFBfIJ4+pxX2GYLokTPHdTk2P2bt4p5afbyNwIjLMGOFE/eRKnOpInIidpn4V524nJo6tRqXQGE9b+KevT7giN0MpiNt9YODDxwVqu72f+eNq7kAcLtGfFrEhonDUt8becVOjyc8K+l+LhkJMpREwJEPMmK8KqUF7IkVxd2Raj6p4+h+VjcXX8uviDYwahA6VSvyUD5iy9LwC6DOy33iP/lfHYE7PRcIQr2nuDizDFTxXnTctmIzPswyhjDU8+bL53j4UG2eGsKh7iCPaxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEVaOHYcf35urmZ1M4zHPJA+I7dXo1GnXZ0ydMVK1Qs=;
 b=A3FO24hhROCwYxKaZ6L8D069dIbTAu95nUOkbcDqj3+I4Hd6/Z2ctgjA+LMh0OrTHpYlzOTOzachTYfSa5lD90JoWdyeFeZnyRvk0P9quVzPvBNR5VV+RBtUIL5pNR9LL/T0ra5GJ0YzinFGXKibPRuqKFMEpJB0KYSwS+WSTQxipnjl8gDIbyneHkADQQAY7u+vrxSYoeIZ+/g4RoyPlPOE27XolIJj5RUDOCeb39C7k1SlO1YQUtEJIuJDuLjfKvqfDNr+Kk/uPV/xGLBrJ6wtxupNIcip/43ArUaA+9asoqMQWjF+4uHx/qMErpOXC4Kd21QBijWVpRDoipt1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEVaOHYcf35urmZ1M4zHPJA+I7dXo1GnXZ0ydMVK1Qs=;
 b=cvJCc/an/xJZe8YR4/KiA/X/slR10DQres0nuEVrm2Ldcz5jYl1EKypKQqFIFyReMZ7dht9YQa8SGXTJWsDGbjhp9ISnRTEnSQjP8EEc/Q6v5W9MiR2kPGtdfh3rf+vhBw6vvzOBv/b9yjWOUHXJLadUZa2gFn1NRd9pCeeMYxB1ccfJtDMPBmpYjqzdqTAUqWnPSZ0gX8nIYR1zitxw+FHi46KnJTl7ES3FZnr3PhfKWDW4d2fg66gkAzoSFhmC+P2coE76Z/hyEj0U5yOOdkWVxJgW0A33nfgcXL+exYV2e15YPUGuNLHGQherg/i5V1siDwLy8yKdKNohX29K5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU4PR04MB11754.eurprd04.prod.outlook.com (2603:10a6:10:626::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 17:00:05 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:00:05 +0000
Date: Fri, 14 Aug 2026 12:59:59 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: make struct dw_i3c_cmd smaller
Message-ID: <an9JjwCdeLxcIVmd@lizhi-Precision-Tower-5810>
References: <20260813044603.22425-1-jszhang@kernel.org>
 <an4rSDgJtDvudtmY@lizhi-Precision-Tower-5810>
 <an6SJAnIl_wdTPNA@xhacker>
Content-Disposition: inline
In-Reply-To: <an6SJAnIl_wdTPNA@xhacker>
X-ClientProxiedBy: PH0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::14) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU4PR04MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ed6f0d-e4d5-4cd0-9d0b-08defa257d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: tyCY5HZdu1V+vhmrPzk0/fDxrNgWsWe8M4oJnIJgSk9yjg9+8zxCVxRs3IcY7KEmlMs/FElfi3xtbo/iBi5XghiHJAq9Ecd9bnoHHkTAdwOieLu6owVmy8BKpbwYubXuZ1NBdRHhiKL6R1R/qXO1PaXccl9iXxtdipIuZaXUbBu2YulBf2BxgrSzr3kIrQRwzSRYv+b71g1hxd5hFUdPs9bfzC53f6xoOsVfzFHb9O4BDXrnLcbm4HNt8gboxnvfoz0WEE4psz/TfsQy2Mlv/yZJm9E8IhxyoPqI+5RERSEIPUIJEamlbm6hLe2f2W7ldvImWHQKsohadAtDYMAWDKWuvFRs3yOCOeP28ds4Yz5lwIyuDAlrSdPVANO+C6JWL3WlvEugZ/Dz712jRB+8K9gb9VYZOFFI/0VwaQgA4BYZsqA20TxReSYtaMVcRdc50yPPdk4kPyfT2uw4aRdKu5832GL0f3mx889Nt9uULOI00yrJKPQEedJPmuUQUivpOLZ2fqZO5Ms7ASm1bK2bgmaGFpe5LtM+4F5QoiL0yy8sm8PZAKlR/zf0MJ3az7W0N3cKURGIEsybLplj9nHrZxRorTl5LrQOKXk0mWDx8Qj/GpTi7+MAzOAKJmzfEywMHDFAdYJxIcs9yH9XRJgXgvpY4oHJyB2RtAQMA5RwNKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvq3bfd2S0w5FQwbKahExLR1r4M4/7RW9mNc0ePInOxrgwO0Z7EDa1Dgv6RJ?=
 =?us-ascii?Q?jcNq4Akgx2aj0aycW2z27OphewcKXysx2kUz7L1AoQWeXq3gka/hVajfHgc1?=
 =?us-ascii?Q?FqXuOW/0u4CyO5Pq/pYWx0yG7e2emIqLmJW7zcb/XKwnRT289KT62FCaWQTK?=
 =?us-ascii?Q?JImJuAsDQfPZ2GRRjcvgF97znjXhgsJrHaCQULcjL+UYpqAHdXer8TSx9pXV?=
 =?us-ascii?Q?Fs0KGFcspk8pKqPIpn2xsV7U0xMA2g8sDCjCEyAhto6gUOErmfYW5kmlv2XQ?=
 =?us-ascii?Q?Ex6Rc9OA1PyT76WYolAeQqWZ0qWG1lR+Mc97WyxJrohPuSPpapFoanqim1nQ?=
 =?us-ascii?Q?oZuc8cv3ck94JlY9sNSHyauW4RAiulz4fwi0nlYrHtdofP7jgmz5PmBzN4CF?=
 =?us-ascii?Q?AIhmStRpWcMExT+t1IBBvcOqohlai+f2nA18G35ZQyqPvKMZJCgevXJMaYl5?=
 =?us-ascii?Q?jB4W/CHMX+tDPjKcJkEvdHYouc7Mn+qMNGy0aU5JXjfjruh8bVsZgBBKF5M9?=
 =?us-ascii?Q?RyY/F8QJHoOBw2eYd1Bqj7WpCdPki8CYKRL6C89tAeogZ91MmibNubJdX479?=
 =?us-ascii?Q?IM5lFGuyBcZHrSKY02Z+e3eClpzjZy7UUQPHicBDlJ/n4YnYXBl8i8vvmqj9?=
 =?us-ascii?Q?jyY3eUcDzXUldiEzQGDPHYScjD5b0P/5/E2MtCjVck8UdhYrgzkUi2qfjg3P?=
 =?us-ascii?Q?Vlrku5L6XWcaAeumBHOuv04rwJ6aWCtU90CgVrh3SRPK6V2d/gy1wuKcbySk?=
 =?us-ascii?Q?x4P6qDL3JEQQQo8NPNEm/cxdj20iTJ8GHweEH/PfqNRfakWw6D2Q9VtkxQp0?=
 =?us-ascii?Q?tCBRu4ebscZLuZ0AgLSwsfBlHEvyUq6FM6zCt7CYIrm8QRPIIVARqF8atqRl?=
 =?us-ascii?Q?TSwehWecyERQlDfgwopQgt1REPYfL+8SRzBfcmq0SUMdznXXgcJGuVCYRffM?=
 =?us-ascii?Q?FP2JYuZ4MzSwRjhnBtOkuW0m0/FRnfvIXj582mpMBY0UA9TuUp1GpjKlLEpE?=
 =?us-ascii?Q?tm93qZ2aPH4PDU5yJKb1tnWLSLj/9NTrFSTv8Gz9pHNgfHC1g3S12HHk483u?=
 =?us-ascii?Q?R5Zj3YxgzXxcpF9QN0UPED8HpbpIVgffld4S/whb9k7AFrHIZfM15vSkDnZJ?=
 =?us-ascii?Q?uXfALNhXcUbDa0tUBMLcIpc7V9jklsm0wQ4YEUM35BhsRvYmJEqbdfZgKlyz?=
 =?us-ascii?Q?jRFS36ZkJ8a0rxrg7jI/TylEFK9dF+8w3W9EAOK3ykkQW0/+YnfxQg87Cm91?=
 =?us-ascii?Q?Kk8pAAob6dX4vN/IkGvQshuL+KicyeMiJIciq3X4CeWXWazcx7+kWwfBaPhG?=
 =?us-ascii?Q?CgQNF0cte4QldM71qcQyIi7msx0iM0M8zwftB3mMn9xmtW9ZbD+yJX6cg9p0?=
 =?us-ascii?Q?ATJS1HAM2TUg1oM7AltjYBEOU663hvyylpt5JBaMXrc+L/nBoXU9EuFW0+CJ?=
 =?us-ascii?Q?IWTy7S75jHCn77rOxiCWWIMpDk8zRTPyjF/AJMqQsImxew5+Ou/d8Rx9Z5aY?=
 =?us-ascii?Q?5zo73dcyN5/Ji+Ot/Z9YpUwdKN0RjBJaEtX9jBBqOO/nBTXM0VQ+9/De5Jh0?=
 =?us-ascii?Q?DbBOSUCwkPcmKDCadWBXgQ7Oxe0Ifq+3YXSz6pFVfZtWirIzRjk22ubuA7DW?=
 =?us-ascii?Q?KQbLGX/kWnl3cgnYKW67G01FTKrX+JFfuKEYQSnUXn+3M7lUy+QqjnvfyE95?=
 =?us-ascii?Q?VseRO+sotCFpxVv0LJTL7va+Es3k/Bcyykbm540lRGO08c5MWaSj4QhYPOzF?=
 =?us-ascii?Q?tBjZMNvpMg1KP9+9Th3ZL8KOtxpxhoqj4hdSXtHX7PvSr6NtjFdB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ed6f0d-e4d5-4cd0-9d0b-08defa257d14
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:00:05.5970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyEv0sIPVGLLVcGirURQz51meGTlriopKyrfLTPz0jrdJOqxeYoJDayX29/Jhe8iKqpRcdbjj8hQSBMOhZl7KRcHT+Oha1Zxh+ThF6CcWIesEK9K2ldR89SxK64T6F52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_100012_051908_C8CA619A 
X-CRM114-Status: GOOD (  21.27  )
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

On Fri, Aug 14, 2026 at 11:57:24AM +0800, Jisheng Zhang wrote:
> On Thu, Aug 13, 2026 at 04:38:32PM -0400, Frank Li wrote:
> > On Thu, Aug 13, 2026 at 12:46:03PM +0800, Jisheng Zhang wrote:
> > > The dw_i3c_cmd is dynamically allocated, make it smaller. For example
> > > on 64bit platforms, we reduce the size from 48 bytes to 32 bytes.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/i3c/master/dw-i3c-master.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > > index 6ba84a97765f..d6f84f0f4c2d 100644
> > > --- a/drivers/i3c/master/dw-i3c-master.c
> > > +++ b/drivers/i3c/master/dw-i3c-master.c
> > > @@ -247,10 +247,10 @@ struct dw_i3c_cmd {
> > >  	u32 cmd_lo;
> > >  	u32 cmd_hi;
> > >  	u16 tx_len;
> > > -	const void *tx_buf;
> > >  	u16 rx_len;
> >
> > only switch rx_len and tx_buf should be enough. otherwise there are data
> > pad after u8 error.
>
> If we keep the error at the end of the struct, there's still padding
> after the u8 error.
> There's no big difference between current sol and only switch rx_len and
> tx_buf on 32bit platforms. But on 64bit platforms, the current version
> makes use of the pad to store the error, thus saves 8 byte more.

Yes, I missed caculate.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Thanks
> >
> > Frank
> >
> > > -	void *rx_buf;
> > >  	u8 error;
> > > +	const void *tx_buf;
> > > +	void *rx_buf;
> > >  };
> > >
> > >  struct dw_i3c_xfer {
> > > --
> > > 2.51.0
> > >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
