Return-Path: <SRS0=XZWt=SL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D350DC282CE
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 15:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3FC2133D
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Apr 2019 15:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzUieZ15";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XJC6bS46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3FC2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrIAHpelI5kyYX8HnMy2UrVAUZs5u/Be9lXmOO+NFh0=; b=KzUieZ15pN5Vz6
	tialIBUGjQw+aIuP8QbphzQFvbwWwIx0A4tXE3KgLw5/s/rn4+t4EpBfqkZo/o2rFSWm9MGcFg0Os
	sRwDWtPGJ8EfH2y/Z+nFeg4nqtRFp+ouSJld7alEFF9gK1fCjiwEVlO0P8oH6+pmmduXteKs2+uxx
	T2FZS+2SZqq7bC6ZVVuswUSgQZPmEgDBmYfUYhekoUhvVXsFGCRdMOT6qdzNKqwExRF0dD/WUhDzb
	y60YNF22EITlPmcr/U20sppUZgdk36UkVePNIs39mfJpuuRlMtj6L/go+j0UggxJ5XnQ8+bzp+Wsh
	wMTHMG6Bb9oGq3iiY+UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDsxq-0008QR-7u; Tue, 09 Apr 2019 15:47:10 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDsxn-0008Q0-Lg
 for linux-i3c@lists.infradead.org; Tue, 09 Apr 2019 15:47:09 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id EB6B710C18E1;
 Tue,  9 Apr 2019 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554824825; bh=G1uK731Uu8gEYYBAhVBNbTNVOo6zX9DbwWhJVcpwZ3Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XJC6bS46UzGZ64JuCzisZgxfi/y6e5WVkwG9EsEU3qBsm5QSewBwmKbia1rsiNfkE
 8rSwsi7a7Yv5RMmqEuXlnLfUYlcdBf7PXy1a/qmOGXFrPv8WXd3OQnvirQZ6HZ3ZSN
 mVaDlxhH8qz2UR7hIA9j47OO4tq0mYFM65o4ZzOtltciUneFlmaj038/9HqdoP75XC
 +SrU3A7TjftzxJ5Hq7p+G3AoyF8jhG7Cx7d0k+M9AvP9Ne8ZzsfZO1VL2zXk0+JPRW
 KfvPf7PbCog+BYFkSHBRc0UjpukbQJ1E8d9jpWUuvAB4GAx5c/PwNZMlLaj+SA2UnF
 CkpnGEZA+7WPQ==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B4CFFA006B;
 Tue,  9 Apr 2019 15:47:05 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 9 Apr 2019 08:46:53 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Tue, 9 Apr 2019 17:46:50 +0200
From: Vitor Soares <vitor.soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <vitor.soares@synopsys.com>
Subject: RE: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHU10l/l7Y/AuF2m06V4TWxPbYeTaYnpPuAgAw6WdCAACAaAIAAIjYg
Date: Tue, 9 Apr 2019 15:46:50 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
In-Reply-To: <20190409152028.GA8934@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RZV1l5WWpkaVlUUXROV0ZrWlMweE1XVTVMVGd5TXpndFpEUTRNV1Ez?=
 =?utf-8?B?T0RVeE9EQm1YR0Z0WlMxMFpYTjBYR0ZtTW1JM1ltRTFMVFZoWkdVdE1URmxP?=
 =?utf-8?B?UzA0TWpNNExXUTBPREZrTnpnMU1UZ3dabUp2WkhrdWRIaDBJaUJ6ZWowaU5E?=
 =?utf-8?B?Y3hPU0lnZEQwaU1UTXhPVGt5T1RnME1Ea3lOakk0TmpJMklpQm9QU0pHWWsx?=
 =?utf-8?B?aFkwdFFjM0JpTDFGcllYRjJjMVU0T0doTmNtb3pjMVU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVU5UVm5FNWVEWXJOMVZCV1V4NFJFTmFjMmxLYlhkbmRr?=
 =?utf-8?B?Vk5TbTE1U1cxaVFVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZEYTBOQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVZaNlpHaEhaMEZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
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
x-originating-ip: [10.107.19.101]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_084707_727256_3548D995 
X-CRM114-Status: GOOD (  26.50  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Tue, Apr 09, 2019 at 16:20:30

> Hi Vitor,
> 
> The 04/09/2019 14:31, Vitor Soares wrote:
> > 
> > Hi Przemek,
> > 
> > From my analyses you do i3c_master_register for secondary master in follow 
> cases:
> > - HC has already an dynamic address and it is the owner of the bus.
> 
> Correct. It requests bus ownership before registration, if DA is assigned.
> 
> > Or 
> > - when it receive MR event enabled
> 
> Actually, when MR event is enabled and secondary master is not initialized 
> yet.

I didn't find where you do this verification, can you point me?

> 
> > 
> > Is this correct?
> > 
> > From: vitor <soares@synopsys.com>
> > Date: Mon, Apr 01, 2019 at 19:41:39
> > 
> > > Hi Przemek,
> > > 
> > > > +/**
> > > >   * i3c_master_register() - register an I3C master
> > > >   * @master: master used to send frames on the bus
> > > >   * @parent: the parent device (the one that provides this I3C master
> > > >   *	    controller)
> > > >   * @ops: the master controller operations
> > > > - * @secondary: true if you are registering a secondary master. Will 
> return
> > > > - *	       -ENOTSUPP if set to true since secondary masters are not yet
> > > > - *	       supported
> > > > + * @secondary: true if you are registering a secondary master.
> > > >   *
> > > >   * This function takes care of everything for you:
> > > >   *
> > > > @@ -2427,10 +2672,6 @@ int i3c_master_register(struct 
> i3c_master_controller 
> > > *master,
> > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > >  	int ret;
> > > >  
> > > > -	/* We do not support secondary masters yet. */
> > > > -	if (secondary)
> > > > -		return -ENOTSUPP;
> > > > -
> > > >  	ret = i3c_master_check_ops(ops);
> > > >  	if (ret)
> > > >  		return ret;
> > 
> > The bus mode is set before the sec master does 
> i3c_master_add_i3c_dev_locked() and
> > i3c_master_add_i2c_dev() and after that it isn't updated. This can cause 
> troubles for
> > HDR-TS modes and when you have i2c devices INDEX(2) on the bus.
> 
> Yes, I see this now. It may happen before HC driver updates device list. I
> should update device list right before i3c_master_register().
> 
> > 
> > > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct 
> i3c_master_controller 
> > > *master,
> > > >  	 * register I3C devices dicovered during the initial DAA.
> > > >  	 */
> > > >  	master->init_done = true;
> > > > -	i3c_bus_normaluse_lock(&master->bus);
> > > > -	i3c_master_register_new_i3c_devs(master);
> > > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > > +	i3c_master_register_new_devs(master);
> > > > +
> > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > +	i3c_master_enable_mr_events(master);
> > 
> > Why are you enabling MR events here? As a standard function this might case 
> issues
> > because the master can support ENEC/DISEC commands but not multi-master 
> typologies.
> 
> I enable it at the end of master registration to be sure that current master 
> is
> ready for bus mastership relinquish. If controller does not support secondary
> master role it can just do nothing with it.

I think it isn't good idea to have this here because you are forcing HC driver to
verify it. If it is to be done in subsystem side probably it is better to have a
master/slave functionalities structure.

> 
> > 
> > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > >  
> > > >  	return 0;
> > > >  
> > > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct 
> i3c_master_controller 
> > > *master,
> > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > >  
> > 
> > I'm thinking if isn't better to instantiate the bus apart and them register 
> the secondary master.
> 
> It looked like that before but we decided to register everything or nothing.

I see your point, but for the future, slave implementation, we can have a
function to instantiate just the bus and another for master or slave.

> 
> > In this way you are able to add DEFSLVS even before the HC has enable MR 
> events like it is done
> > with dt devices.
> 
> I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> from
> current master right after ENTDAA. Could you please explain?

So the current master receive an hot join and send the DEFSLVS, when do you
add them to the bus? Will you go for the all process to get all dev info and so on?

> 
> > 
> > Best regards,
> > Vitor Soares
> 
> -- 
> -- 
> Przemyslaw Gaj
> 

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
