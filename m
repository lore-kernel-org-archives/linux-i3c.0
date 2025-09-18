Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E372ACA1013
	for <linux-i3c@archiver.kernel.org>; Thu, 18 Sep 2025 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivljxBrDl5deOC2iOlJdZjcgJ28S0ESiCrmvla5k47k=; b=t2aCkw9wpUMJIx
	7e6Yg4MS4rgF8Z17H+sGuEtY/b94HB/5Olq0mG4zz6z7EQuzjuu5wwSa2PDyXaNEbHtFPx9fP5Ldn
	iL67Gt8Kh+uQY/2FjpOvQvOZbP65aQilwHO6TyPDkaxDAkQ9HNYyIL6m1WuORlEPql5Ty9MuzsyBz
	8ik3u7wYyz7yH00bbKS8qzt8oWCrnVJq6gVYsCwgSXvxTxQVcn3zD7SjcRo5sZRUxDXtkzVT3xws0
	x/E3oBdO78YSP9gM9MR+pVG4fsKa0ZDDKnV5ZK/0Xy9Vr5sMeDdb+Cfx3gxw+opkmhytGsUe0eHjl
	z+uQxQv+5KmyCeGll4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFQC-000000005Mt-2qjJ;
	Thu, 18 Sep 2025 14:15:40 +0000
Received: from mail-dm6nam10on2070e.outbound.protection.outlook.com ([2a01:111:f403:2413::70e] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFQ9-000000005Jt-1XD3
	for linux-i3c@lists.infradead.org;
	Thu, 18 Sep 2025 14:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtozzycgA6v4bPCkJs6aJc+FBH96J80sn08B+OG5jVhGzRaWbtN+KKLO3gAxiTW/YQTwf5RgjyUfOGpfMr7YiGrphseIz4kHt5vB4bmg+0npSpE3gtyI72I+sT113/Mtj2ZEa0u8Lo538HRjVC60xkmmM1C1NVRyUjuV6WNh5+XrJp7UhNM/nh/95f8oiYfrp+KbMmLL8Im1cppEayr5BPmWErxVsHGZzJ/knqL4aK9cWkTaoK59aZyl8SVcnsDs2/arjYmz86HCBR2bLLm1ab2Kwm2L5loSFf+P4ZjrGLno/7eAkLkRvaDhuxURKqrSJ7efY6mh5R/rbLsN6RP/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiVZI6eUsD83R0RgOzHDd5mTCmJUdCv+/MEMgf170VY=;
 b=C2QywkK2JTvQ03PEpjf+A7JqMc0VKX/ZyiKV1aNzT7A6oLEKACzMJrLNwKHUX82FsqycS0x0Pq61JTTD2m2oPni65wlhXMaYlWrnrX7qb+HpuTlz2BRZ/FmQyAKgz7RsuFfLHl1xXPKGkvyMb+mVCHmEj61Tw9mhNKz68ByoC1i3ukYkW90gERRdDh0qiulXKFuUxL7EIGAk0cDsDRr+PP2Q13vFsk6A+FDZWixDjg+FANxcyEzeV6tHr612QnAlfT0sv84hUHEhG3vmOxgWlGusJnMfQDJT0SvszG85CBTARqH8yepOtkeLubr0PN68PiZ9yW4CzcGRMj+eJUX19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiVZI6eUsD83R0RgOzHDd5mTCmJUdCv+/MEMgf170VY=;
 b=ZR6iBM7ocf4Grt5nbqMW0QsL1lUMXr9CGg00K7PM8frJrHYoSv7DgI8fYdFHGfqmC9Bkr8gcmlta+6N9h7V0dDImlHamKoHjgWTExFPz6KO/d7xXW5nI5AcVizcwb2lXlxp5JnxXrkw/vFtX3Tlpilk9Okg6c2ciR6KkGkLEaBkhD8chjVfGg3yEiLF2S/euFSZp7IlRXX/hizx3GKhx8P2HXlT/g9ek2Z61IIVl18K+SKTP6aAd+iFWZr4OnYIgFFfZwfhneSW+7ThBOWcgIIeJdPYdLb+khHDvgfTVEQxqSFanEV51MqvAFAUZkcBW4tC4wcjGhMeWGDUE5l0/0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by BL1PR18MB4357.namprd18.prod.outlook.com
 (2603:10b6:208:31e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 14:15:24 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 14:15:23 +0000
Date: Thu, 18 Sep 2025 16:15:17 +0200
From: Boris Staletic <bstaletic@axiado.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aMwT9S92IpIOT_Gq@axiado.com>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF71D32B30E:EE_|BL1PR18MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 88629de4-380e-4102-4722-08ddf6bdce7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ajFAlFAGfWPkCANd1MAcPb8rWoX+nvvpOMFAmAQyfbw/NtMKIdcwV1ImIPHm?=
 =?us-ascii?Q?WExQchUsQVeufU4pXrYfONMKS0r2Vh8747GoLPfO50LAE9PJZYZmtIf+P1ih?=
 =?us-ascii?Q?u7zfm2+SVqhDIkmu70/UJ6XZRzVZD/2o+OYZCu/3UM3V0KlaBTu8TbhZM+25?=
 =?us-ascii?Q?QxnkIX3SB+pSSAMVN2Q0sN5fDUGVUT2QEG+SJCY4HUY2SEb5vQ12EwuTvkUi?=
 =?us-ascii?Q?Q3MHtzYjzIQd62SJtonS0p1xFCXKoqA31+0KX6rLt7ZJ+edEsEga6TIlbeAu?=
 =?us-ascii?Q?wHUnwHfg2EJP89rIU8r1Slmt621rz+SaugYdJOih20be0/DPtw4dBni1CsX+?=
 =?us-ascii?Q?yFOA0CHoO/PM9a8h/MOREsPynPwBT71SWHGcXweVMkNFhvh9P7+c+N3gJayu?=
 =?us-ascii?Q?xuCXdEhgyxo+ttD+HSyIYy/tzfN+RYwF8hwCxjdYWE6ngbTDbZcEHPfHso/Q?=
 =?us-ascii?Q?/XwPHYdjJfMAgjHqzmeLZa5n87bQXcQWzAsllSGnyU2bZRm/cq9uHkVPgk4W?=
 =?us-ascii?Q?oDtMTzlqYA/GRWYCjuk04FqI+FMfNbpLSjYrsb1W6SaBADSVJE1jafO8c1P+?=
 =?us-ascii?Q?C651FwOllJ/RsC0ezxQg9hJGZu31eFSdwEtyYvnVy0H03d0lbcdf6GrAX/Mh?=
 =?us-ascii?Q?+b/P/au3kDj1b35dW9gDF5Xas3SN3udmqbHnXZ5AlPhnINadTvBoZreOS6nJ?=
 =?us-ascii?Q?ks94hT7k5eoamsV+IHlS/poIo1OcmjU3bOJK2KYtQrvHd57q/rvj1oTE8KsO?=
 =?us-ascii?Q?YkqS97Vd3eRPchOaJZxe82Lq4q0ciV4VQCfBafD7NYCiFy8yOzLLe9zGGh08?=
 =?us-ascii?Q?0GHutzFST5t0dAmBXdkK0lS5ZJnSMN6uxQM3spi/FByzXGQpSzTHFIRLHaxo?=
 =?us-ascii?Q?KxigK/0uHmre2wIVeO6HgcpIQO2iOQRdWqOb30QZTUKdaB5nAej8rO/uT6AI?=
 =?us-ascii?Q?AijSU+PMkzzOHR/ObF/kULlqhVhWNGGEQ9f5sFeDy1w5CDVSvztevPW++Rls?=
 =?us-ascii?Q?EFh/6rt8M8n5IPYOoNk7y5eeIv4ZIpwIoRCbQMYsfLKbGOdoDBAnq5oQaqXi?=
 =?us-ascii?Q?UZebH5Tk7ZFbxyRg1MvrycI4FtKYar6JrrDrTkE1+Qw7xP2xLG2iS876+4Vp?=
 =?us-ascii?Q?EZYwKcI45hYKhIiGVqMP5wr/+h5JhaNF/QkEGDk1Zta3EaIHf3dJzUa+it0S?=
 =?us-ascii?Q?0wYb/kqzzKxNwvojdQ6lDfOohV7fhT0f88eoHwxT9dlof3SCrAgweHvMxVYi?=
 =?us-ascii?Q?uCzA3Kgdc0A1wqBmw/JgGtgLyPvOOPSKBFTq47cV7LziMge3aBV5QRGWPJaa?=
 =?us-ascii?Q?EaX11/abAk/M3tEkr/z2nn4UoagHF9CRZ0fPCAnAsVS6nxlf5mZQERmODqE3?=
 =?us-ascii?Q?qDmeYlan9im1nFilWr3h714+qFRxq5DPjxV7o48srAra4Z2cwrlGm8NTdP9H?=
 =?us-ascii?Q?artm49uW1tY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lQNJruyUuTLh+6eHIawBeCZlojLnA+kKVW6RNcUi/zLSkIFaMRsTm1NCcrC4?=
 =?us-ascii?Q?WxaUi+OtyqNAK27Cw5brX9YmGauArfDNYLM3PwMFRyFrjsjVIY/oRjmSMwkW?=
 =?us-ascii?Q?hEob6g1SgZZfFELo+W3DhkWyqN0vqL960ApiTNI/T4Bo9NrnvOFEtu3LdUpr?=
 =?us-ascii?Q?j0cF5keJr+Fi/v3ssDU3PhWaBImPu/HKKGelL0zmr6V9VWirBkWaK1BSIBnB?=
 =?us-ascii?Q?T4Hv69DDBl9+kwF4IDUc8DAMLs35muoEBNXDQhMwGHAHEJkV/6SWjUA42lCb?=
 =?us-ascii?Q?2IvsCPf2anxPYwQ4w3xqg0S+q0iuHQXn4qc/IYurdn1JC2mTerZE3ppy+PF4?=
 =?us-ascii?Q?bURQ//o7cdZXtZeF4RkPoeFLBN56iDTPC7kkP/XNxPSCOadjRxKRVqx2hhHC?=
 =?us-ascii?Q?4KvBBV9NnDr2zmq8pZA1MFzGHDnOQfd/wQUB+TmQJ6uTm1z0anBbLlGOB4yx?=
 =?us-ascii?Q?/ksy4m5FwSMMIVkeFVBR9q+kazojtViT+fYdJU3zEzlVeG3rDjvs4QpT6Euj?=
 =?us-ascii?Q?JWCdc9HW+KS4LqJIJsHZVcaZrn7QpU6br1itzdiPvkhlla2nJ8ZVrlMg0r1E?=
 =?us-ascii?Q?iUNuAriG/xJv6AXa5jTzPn5MrHTe7jkedtrq2/PfQkNd+Lbdf3Cqcyi10ZGt?=
 =?us-ascii?Q?Ngs4V5CX02ok7TL+Bh+WnUmgz4Wxc5Vz/M0zXmgCwKRx+XBHkL2AyLGDk1go?=
 =?us-ascii?Q?kU2zx1WMUhvv45uaug1h1cnMWgI80yS40cajSV4zEUT+8j5GLUQp43Rl2+Ff?=
 =?us-ascii?Q?IRnPw0K3cC/3Qgy4Tp5LhX3K0l02kBBWbprsb77bha26eBIbaLFpKH4xPVKe?=
 =?us-ascii?Q?luEB5mzRM4mh567gAXINZQP3ElkCN1luYg4lu1CS6mNu7/BN1fzlGw/8Gy6D?=
 =?us-ascii?Q?j8W+GvhMuNj5akqTyjPUpBPS/pYjHAw/TWuvJ3MDWP51fIpTqcOnVzi6AN+Z?=
 =?us-ascii?Q?DOFlNVwRyjlJGjE78ql2dsNHNmsBCbO/cO6FtLhalvW/p2+7hBN27auVKGoj?=
 =?us-ascii?Q?Xa7Pl8oUqS5wso2JDKOCwvmi1/JfW85UkbAxg5PK4yJuPTrXE8MdgEyntzYw?=
 =?us-ascii?Q?1lLOqERGTEJR3/8OygglBxUfsMZcsfwci29mAxzZdX9lZvjl1plwU8yyxCQK?=
 =?us-ascii?Q?AOtJ7JNK+lw0el1zssL6LU3M321rWejAzxDgHB9UVZsb0pMJ1BF84wC/BAVw?=
 =?us-ascii?Q?o7AILuELDf1cWX33Am2g6nKTY1eeIPMtvW3jvCwfIoYMwre+7vLFiCzw0x+V?=
 =?us-ascii?Q?ULCFvc8md2GC+9pH7Yzs+gbrv401KM+TYT2Un5LLyLiDFgl8gTXsKrT4lZAD?=
 =?us-ascii?Q?DB3uQp6TCmNLuuKYUrZxurwFJ8lTcPUDNp8IUxyR7X6M2ARBWpYNXRHxhU+1?=
 =?us-ascii?Q?6D6OYoCkWDSb2PLrM+ejr3TeQ11CCZed96LB0XxXmVfrA9KyVfpTWtUEZF1P?=
 =?us-ascii?Q?dLFkDXBRAyIKm0kUQKBSh8nSxDSk88BihoTasH2tN6WG0SLyX+HQZcJHR5rh?=
 =?us-ascii?Q?Nmre0qWLwPiAddM9DRa/MjkALwNiueweR9ZnZ7nsWYiAKBiWwhlhOp594hYh?=
 =?us-ascii?Q?UTeFOYPsZZmvPBqnEMkxirT0WmKZe00QiKdNo/zV?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88629de4-380e-4102-4722-08ddf6bdce7c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:15:23.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wPx+ISBfK7w1k4KUagcMcP7i9qV4aVnzHRB+UbZDRsB3v6HQi/S4wx4dmhdBTzd5VzNW8TpltjPbmqrxeTI6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR18MB4357
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071537_421065_562132D0 
X-CRM114-Status: GOOD (  26.16  )
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

On Tue, Sep 16, 2025 at 01:08:44PM -0400, Frank Li wrote:
> On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
> > Hello,
> >
> > We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
> > of using i2c-utils to communicate with the I2C slave from userland.
> >
> > With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
> > All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
> > I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
> >
> > Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
> > with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
> >
> > - i3c_master_controllr's i2c_adapter needs to have its class member set.
> > - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
> >   - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
> >
> > That much was enough to get i2c_detect to work with an I3C master.
> > To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
> > In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
> >
> > Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
> 
> Generally, it is the same as I2C. just send out address, and check if target
> ACK/NACK this address.

Are you referring here to i2c_new_scanned_device? If so, that also, in
my testing, couldn't detect any devices without modificatioins.
The failure to scan happens because:

- i2c_new_scanned_device calls i2c_default_probe, which calls
  i2c_smbus_xfer.
- that eventually gets to i3c_master_i2c_adapter_xfer, which looks up
  existing devices by calling i3c_master_find_i2c_dev_by_addr.
- i3c_master_find_i2c_dev_by_addr returns NULL
- i3c_master_i2c_adapter_xfer then returns -ENOENT, ven before trying to
  communicate over the wire.

I am probably missing something, because, as far as I can tell, neither
i2c_detect, nor i2c_new_scanned_device can currently be used with an I3C
master.

Would you mind elaborating more on the suggested approach?

Thanks in advance,
Boris Staletic

> 
> Address 7E, REPEAT START, scan's address. ACK/NACK STOP.
> 
> Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
> way.
> 
> send 7E to avoid IBI during you send out address.
> 
> Fank
> 
> > The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
> > I'd welcome any sort of feedback.
> >
> > Thanks,
> > Boris Staletic
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
