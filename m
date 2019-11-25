Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CDCC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974BE2084D
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKSAwOHm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PG31sp6c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="aRcNX2vn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974BE2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA2WUyHYAT1OVfgcipakMIqJ4sLq0RbRCnPqfM7xrNM=; b=NKSAwOHmt2CWxJ
	HaIon2Tg/s18JNyoCAe/jNYm9+N2JWU1N8d9zlICae8Kay1Ms2SfHSC5B6k72JSAQculKQpU29YzD
	WCEpZuXb4PLKTfvr5ltnyU898De1qz5aieoQVgDltDrdNHHK1u3fqzWY+eXgUQKpwDc6nEHBmE+Km
	lmX0du/g7tnz2HVJ8GPx3788RXL+Fe8JuaKvrkAAFh1gIZb9m2ezJmv9A/BPnyCR+XDjGBRXC2FGQ
	o2BFfyKGNJ/0Z2O1G08Dc/Oj7zzU5x0gO2tGp9cWce7r3jLWtayq5aSF8LeW8xU90ybm+ZqT1dYu9
	/H/G0NmnVdkmgpJtSPcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZCPL-00019S-6X; Mon, 25 Nov 2019 11:19:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCPH-00018j-Ss
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 11:19:53 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D2F1C00E0;
 Mon, 25 Nov 2019 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574680787; bh=u08RjP+CIDIZOJ9F8oTEs6yU1Bp8ZikmqxnCO0tk/6E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PG31sp6cnTW7kQyWmNDuUMpTIkU1hS1ZqWTvE80Zowg+Cmb2GgOu+lyU8tBEuqmj5
 sKC+v6vZ9T7zK3f/FKMwZk30krmrUphsgWkSTexMzAXaK6glkJebkryzE+4PGW+Rmh
 aA3xd+m8L49dj97M7QvBh0iEgwvU+Dez7XEg0Y8IdBekrTvidXlAoqKLcOk5XjKOJf
 GEiZxk5H9ijZUqTaM+Hhwx053T6oqTm4/EemduRJ4xnvy5xK50ep+GxmO/Okzu4Ws8
 WBY1bcwWmT5Rj8h8rOrF1Pmcyv7pb9vcdc/GcsPGaezqdKsUGkYBhrx0LdUH0gB1iN
 +68IZTI81s3zQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 36B9FA0079;
 Mon, 25 Nov 2019 11:19:46 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 03:19:45 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 03:19:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxhlSn0ejXXYQk/Qs+2SMRJ9KcDX2ZfHmSeDzbwUSyknQck2nIhYk1Ao36gFE6+q21RnTsZl9fvrwvm5EMlYRKr41al1dQsTbLlXwt8XHdGdr9kUsZmwRPveqlmJnPwgJ0T6OWtA+vnTdj0AE7TJnOkwKPfvixuD77LqsC20KeAaEAs19l7DbmztzvfBIe6M30vEyL4eT4uJJ6inLy9JAFL2zHaqnchEvm6dASyoYCNHbeEObc/BKsVGpVyjqKfbdSCQeG197xk4bfyA5nD0EC4+ZMNTMs5y9tZojdGDOqG2/S3Qgl1fQ0slJwYAc5yzYAWs4a4J1oODWHqccE+JBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u08RjP+CIDIZOJ9F8oTEs6yU1Bp8ZikmqxnCO0tk/6E=;
 b=RujOeVmT8DmmvDLVHXJ3I7MOlZCkOUweuTZvSKkv82Snl/N1p7LA6YXHms4p4nE20ce6/O84XU7vEH2EeFK1h/noQQSaym5EVFpU8nuwfLCZt0nR5eyAg5ev7zZ7efsA7v0SMsOAdXV095MktYJsHsXHymUyGAeY4wlU13slu3YP0TS+JQHdO5XwOlJFNSn6ninxvwCc9O+ZjZtbctjjdWM66dik0J15J/9aocymo6BTPLp1OoBIJe6CrGiCGcyVcLjUaFgQzlA6k1lv+RkhzZvzVfet95NWPledGRp82Jz8PbnR3XYFi5ELpTlO1zOuv++GHhXRxWfBbVA//tvgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u08RjP+CIDIZOJ9F8oTEs6yU1Bp8ZikmqxnCO0tk/6E=;
 b=aRcNX2vnYXgCO2iJPFsZhlwojFGs3aIWxN+F1KKZQLXd2etQbTttLuSUlR5f+4efBmXkfll+E1/uI9441rzUKlARq47A46tb/qUTN+Z4DqfEM6K8/tk1kdRjiO+tJmhltKzBb0TbS1Owh3/TUARn1WZCaZ8agA6NBKglLK+XFEo=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3784.namprd12.prod.outlook.com (52.132.231.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.24; Mon, 25 Nov 2019 11:19:44 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 11:19:44 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wA==
Date: Mon, 25 Nov 2019 11:19:44 +0000
Message-ID: <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
In-Reply-To: <20191125080220.GA30630@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3ROemN5WXpSbVlqUXRNR1kzTlMweE1XVmhMVGd5TmpndFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRGMzTW1NMFptSTJMVEJtTnpVdE1URmxZ?=
 =?utf-8?B?UzA0TWpZNExXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU5U?=
 =?utf-8?B?TTVPU0lnZEQwaU1UTXlNVGt4TlRRek56Z3pNemt6T0RZNUlpQm9QU0pYUVhG?=
 =?utf-8?B?R1UzVXpRMUU0ZFhVdmFFazFNWE0yTTJONEwwWnNabFU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVUpPUTI5Vk5XZHhVRlpCV2tkWFZHMXlUVkJwVlVkclds?=
 =?utf-8?B?cFBZWE4zSzBwUldVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZEYTBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVd0NFYyOXNVVUZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
 =?utf-8?B?VUZCUW0xQlIydEJZbWRDYUVGSE5FRlpkMEpzUVVZNFFXTkJRbk5CUjBWQllt?=
 =?utf-8?B?ZENkVUZIYTBGaVowSnVRVVk0UVdSM1FtaEJTRkZCV2xGQ2VVRkhNRUZaVVVK?=
 =?utf-8?B?NVFVZHpRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdk?=
 =?utf-8?B?QlFVRkJRVUZ1WjBGQlFVZFpRV0ozUWpGQlJ6UkJXa0ZDZVVGSWEwRllkMEoz?=
 =?utf-8?B?UVVkRlFXTm5RakJCUnpSQldsRkNlVUZJVFVGWWQwSnVRVWRaUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZhWjBKMlFVaFZRV0puUW10QlNF?=
 =?utf-8?B?bEJaVkZDWmtGSVFVRlpVVUo1UVVoUlFXSm5RbXhCU0VsQlkzZENaa0ZJVFVG?=
 =?utf-8?B?WlVVSjBRVWhOUVdSUlFuVkJSMk5CV0hkQ2FrRkhPRUZpWjBKdFFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJTalJCUVVGQ2JVRkhPRUZr?=
 =?utf-8?B?VVVKMVFVZFJRV05uUWpWQlJqaEJZMEZDYUVGSVNVRmtRVUoxUVVkVlFXTm5R?=
 =?utf-8?B?bnBCUmpoQlkzZENhRUZITUVGamQwSXhRVWMwUVZwM1FtWkJTRWxCV2xGQ2Vr?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVGQlowRkJRVUZCUVc1blFV?=
 =?utf-8?B?RkJSMWxCWW5kQ01VRkhORUZhUVVKNVFVaHJRVmgzUW5kQlIwVkJZMmRDTUVG?=
 =?utf-8?B?SE5FRmFVVUo1UVVoTlFWaDNRbnBCUnpCQllWRkNha0ZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJRVUZCUVVGQlFVRkJRMEZC?=
 =?utf-8?B?UVVGQlFVTmxRVUZCUVZwblFuWkJTRlZCWW1kQ2EwRklTVUZsVVVKbVFVaEJR?=
 =?utf-8?B?VmxSUW5sQlNGRkJZbWRDYkVGSVNVRmpkMEptUVVoTlFXUkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZDUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVsQlFVRkJRVUZLTkVGQlFVSnRRVWM0UVdSUlFuVkJSMUZCWTJk?=
 =?utf-8?B?Q05VRkdPRUZqUVVKb1FVaEpRV1JCUW5WQlIxVkJZMmRDZWtGR09FRmtRVUo2?=
 =?utf-8?B?UVVjd1FWbDNRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJRVUZCUVVGQlFVRm5RVUZCUVVGQmJtZEJRVUZIV1VGaWQwSXhR?=
 =?utf-8?B?VWMwUVZwQlFubEJTR3RCV0hkQ2QwRkhSVUZqWjBJd1FVYzBRVnBSUW5sQlNF?=
 =?utf-8?B?MUJXSGRDTVVGSE1FRlpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVkZCUVVGQlFVRkJRVUZEUVVGQlFVRkJRMlZCUVVG?=
 =?utf-8?B?QlduZENNRUZJVFVGWWQwSjNRVWhKUVdKM1FtdEJTRlZCV1hkQ01FRkdPRUZr?=
 =?utf-8?B?UVVKNVFVZEZRV0ZSUW5WQlIydEJZbWRDYmtGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVKQlFVRkJRVUZCUVVGQlNVRkJR?=
 =?utf-8?B?VUZCUVVvMFFVRkJRbnBCUjBWQllrRkNiRUZJVFVGWWQwSm9RVWROUVZsM1Fu?=
 =?utf-8?B?WkJTRlZCWW1kQ01FRkdPRUZqUVVKelFVZEZRV0puUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRV2RCUVVGQlFVRnVaMEZCUVVoTlFWbFJRbk5CUjFWQlkzZENaa0ZJ?=
 =?utf-8?B?UlVGa1VVSjJRVWhSUVZwUlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCVVVGQlFVRkJRVUZCUVVOQlFVRkJRVUZEWlVGQlFVRmpkMEoxUVVoQlFX?=
 =?utf-8?B?TjNRbVpCUjNkQllWRkNha0ZIVlVGaVowSjZRVWRWUVZoM1FqQkJSMVZCWTJk?=
 =?utf-8?B?Q2RFRkdPRUZOVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZD?=
 =?utf-8?B?ZWtGSE5FRmpRVUo2UVVZNFFXSkJRbkJCUjAxQldsRkNkVUZJVFVGYVVVSm1R?=
 =?utf-8?B?VWhSUVZwUlFubEJSekJCV0hkQ2VrRklVVUZrVVVKclFVZFZRV0puUWpCQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFV?=
 =?utf-8?B?RkJRVzVuUVVGQlNGbEJXbmRDWmtGSGMwRmFVVUkxUVVoalFXSjNRbmxCUjFG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlEwRkJRVUZCUVVFOUlpOCtQQzl0WlhSaFBnPT0=?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1455767-8e9e-4ed3-75a0-08d771995f6e
x-ms-traffictypediagnostic: CH2PR12MB3784:
x-microsoft-antispam-prvs: <CH2PR12MB37849B358FB3F53996D24EADAE4A0@CH2PR12MB3784.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(189003)(25786009)(478600001)(52536014)(6506007)(11346002)(7696005)(76176011)(186003)(102836004)(81166006)(81156014)(5660300002)(8676002)(7736002)(446003)(66946007)(66556008)(64756008)(26005)(66446008)(76116006)(66476007)(229853002)(14454004)(316002)(55016002)(66066001)(6436002)(6246003)(9686003)(4326008)(305945005)(33656002)(561944003)(3846002)(6116002)(86362001)(2906002)(99286004)(54906003)(7116003)(74316002)(8936002)(256004)(14444005)(6916009)(71200400001)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3784;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ViTwrxjDvpOvIc33M825PnyNYWZxo+D00w4m2z3eoFRc5k02Gk956xfcr0m3s1EIJZhVO2TBowQgipsQHQNIcPh8fjAOBy+1exeERRZCui3jJDwFwsyOIlTCzAPa1tF77n6fmAUu+Tn7Wyhjdq+8wYz1G6kKqZPMOBOBKWrdA9Er7ZuXyIhdZJnZUnR2XCQrEKqyvqZMmQbZTelekCcZ1M+B7gUrZqelmLocv5KQjpBslBZx42o5omylTGenq4c/xcxYMX6/4aYo1b/eRiplvd/lja3IfPddxhe+2tD+5cBRUi2q9ahXB1DeWQBo3Ek7Qeb7gLMWDvMy2yeqXvGxGRJghx6jZVubNvQchDrsj+K6hC2MYeSLj+KNVUk83C3yN6pfaYbFxp3jM2Go8dkD2TepH7vkjdbpiBP/W0KDLLTZvSvOf9ytHHKbCFcPOM30
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e1455767-8e9e-4ed3-75a0-08d771995f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 11:19:44.0616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mm3eFOU4BqwDjZp1NRllsX+nLJiNui1mGsbAM3blozfuUjnlQqXwcVPG59kWNi0KqVBppUx7PqGVAzJXONWVCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3784
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_031952_166006_4F64A8D5 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Mon, Nov 25, 2019 at 08:02:22

> Hi Vitor,
> 
> I don't want to bother you but I have to start working on that ASAP. I
> hope you understand. Can you answer few questions?

Sorry I'm already working on it but I'm a bit delayed.

> 
> The 11/14/2019 14:17, Vitor Soares wrote:
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Nov 14, 2019 at 12:32:14
> > 
> > > Hi Vitor,
> > > 
> > > On Thu, 14 Nov 2019 11:56:00 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > From: Przemyslaw Gaj <pgaj@cadence.com>
> > > > Date: Thu, Nov 14, 2019 at 06:10:12
> > > > 
> > > > > Hi Vitor,
> > > > > 
> > > > > The 11/12/2019 08:41, Boris Brezillon wrote:  
> > > > > > 
> > > > > > Hi Vitor,
> > > > > > 
> > > > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > > >   
> > > > > > > Hi Boris and Przemek,
> > > > > > > 
> > > > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > > > to address during the takeover of the bus.  
> > > > > > 
> > > > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > > > I can have a look at it?  
> > > > > 
> > > > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > > > change to make it work? Also, which patch version is this based on?  
> > > > 
> > > > I'm closing a task and after that I will prepare the RFC.
> > > 
> > > Okay, can we have an estimate? Are we talking about days or weeks?
> > 
> > I will prioritize it for next week.
> > 
> 
> What is the status of that?

I found an issue in secondary master init flow on my side.

> 
> > > 
> > > > 
> > > > I based in all version and tried to pass everything to master.c file.
> > > 
> > > I'm not sure what that means, but okay.
> > > 
> > > > Right now my challenge it to trigger mastership request when a device 
> > > > driver want to access to the bus but I believe we can discuss that after.
> > > 
> > > That's kind of a basic feature when talking about mastership handover,
> > > but sure, we can discuss it after your RFC has been posted.
> > 
> > I need to test if the time that device.c request the mastership and the 
> > controller has effectively the ownership of the bus is short enough to 
> > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > housekeeping of bus takeover.
> > 
> > > 
> > > Note that I'm not super happy to have to go back to square 1 and throw
> > > away all of the work done by Przemek, especially since Przemek was the
> > > first one to post a patchset and he never really said he didn't
> > > want or didn't have time to continue working on this task (not even
> > > mentioning the time I spent reviewing those patches...).
> > > 
> > > If Przemek is fine with this situation I'm okay making an exception,
> > > but be aware that it's not how we usually do: the person that posts a
> > > patchset first leads the thing (of course, it's even better if there's
> > > some kind of coordination before the patch is posted).
> > 
> > Honestly it looks like I'm competing on this which is not the case.
> > I just pointed out my concerns about this adoption because I see several 
> > issues on it. The point is, at the end you can pick some parts of my sec 
> > master code and integrate in your solution.
> > 
> 
> Can you point me to the version of the patch your changes are based on?
> And also, can you tell me what issues you faced? I would like to check
> if they are already adressed in my code.

I used v3 and v4. From v5, I found useful the switch case (request, 
deliver, handoff, takeover) in hc side.

I didn't hardly test how device.c request mastership but I suspect it 
won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
not be the master yet.

> 
> > As I said previous for I3C spec 1.1 secondary master received a big 
> > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > any other protocol that implement such kind of feature and for this is 
> > from far the most complex feature to implement in SO based systems from 
> > i3c spec.
> > 
> > > 
> > > BTW, you mentioned working on a lot of different topics, but most of
> > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > framework/API, ...).
> > 
> > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > only expose i3c device without device driver yet I'm not happy with 
> > transfer struct.
> > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > need of a tool for ccc (but for testing purposes it would help a lot).
> > 
> > > Any plans to post RFCs on those aspects anytime
> > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > that each developer work on a different topic instead of duplicating the
> > > effort...
> > > 
> > > Regards,
> > > 
> > > Boris
> > 
> > Best regards,
> > Vitor Soares
> > 
> > 
> 
> -- 
> -- 
> Regards,
> Przemyslaw Gaj

Again sorry for the delay. I will try to send this soon.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
