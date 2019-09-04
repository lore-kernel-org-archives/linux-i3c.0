Return-Path: <SRS0=QM85=XF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E8BC5ACAE
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D586821924
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Sep 2019 06:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E3ZeL2uu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R/6NDIn5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="jOBtL2N/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D586821924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwOOh4t67AlwuQS9+KI82KIBjwgrmtHpL+gQfvjJOsE=; b=E3ZeL2uuZGzT1I
	XnZTbhMiBKnXN9RifhuBBPPCKa/clX2YTa1BLBxlLYOQOM9f9m4oetANnkYrN1oaTyk2li2Vg6Jlx
	NyqOVZQoP26FzEv0gm9dbsBgGoXfGrXck7z9ht5By+g9nRsk74L08xEil5j2NJaOw0TRFFBkYNITM
	0CPN5mxlvhRZNsEJwA2pxpMU7s/ylmi7sZ+GUmGZhwbdP9k6jDHGlwgBHIHPGQV3BT/x9oP0rsCgx
	1RzGDIb/SWalRi5Cu0167fancGj3MwdsqJHa3APpBOdytw+/SHXYOaiEHH3Llfyx4yoY+HAUFRS5x
	PgusK+sNylAnty36cQEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7Zof-0006u0-Gq; Tue, 10 Sep 2019 06:39:53 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5RFV-0004NG-By
 for linux-i3c@lists.infradead.org; Wed, 04 Sep 2019 09:06:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF80AC0416;
 Wed,  4 Sep 2019 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567588004; bh=PPBWvz5JmG3kU6reElf8EYBRks0FH8gGcgJgvb5J1to=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=R/6NDIn5uUM9WjTdfIN5rdwUyl7rZzwje2rUKPHOfyZVveU5YpYSHEJJ+29ZOU15D
 aHZVUhsFABwL7VNlOtW4XKeCF0AHB0QoanDfxVOsl/Q3Djl2K2ZxKcaQL2xRYmDXtv
 KS1XQg6pn7a0dr5logsPBflHoZfbeaZCkMH3P0zFG0f934S9Jg1PBXXl6JcnkPNW4y
 hKItMlHN/9ADQpJbGS78TxOhrCfziB5BrrYZ86TZXXbyju5Tn0vOArqPM+keZxM+mG
 rKHv0cMJ0X+YkQUGOvJJM1vgnojnhes/H89hfC8y/P8WaadyGeWOyvlhyElLrjxul1
 Qw5rIgCCOLloA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E74BDA00E1;
 Wed,  4 Sep 2019 09:06:42 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Sep 2019 02:06:42 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Sep 2019 02:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPFDBGYkuhaoslP6Q0HAI3BXN6MQzV9ejmJeYG14yiujiwEv0Vr4/L0F67jqCcRF8KdbvGWlTnxv95AsrMYuDtgQyqdocWRVVyrDjkICC9lhA2ZiY67skn9wHXRANQhClMLEezysYRHwi0mGjnRPBxjfREcXyE8oLHZTwVZnmZGqJQ5xqlsNLlHDsmQ4iXa+gYrUGgkr+JP3QyCIfyzGNg5z0OPpw8SHh8A7M5iULkMtAkLet9ZN5Xu49lcn3x0PlH4AivgMHnmS5Uick5wNwcB+kz6rnsR1lneue85xYoJvmPGNOUeVyq0mTRZxJ6j/0iqcKvPOzutUYfLkoWS9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPBWvz5JmG3kU6reElf8EYBRks0FH8gGcgJgvb5J1to=;
 b=N5NVYE5g06lMHz7Q91prnEvWPRsQTv9N59B0QsDfnTLlwBoPUjSrBHnmoTvtWdqDLBiW27dO4VkAE3gH9xzP+Cd3uFn/8aPA/UE0tuz6+kBab1uPEJDNVhei0b3QysFljCIBOYs8iqX4rkUnPCDlw78f0FxV+HficuSts7thtFDhhtCAkeks3V/BVvS5gbeHpqkLa2I77WAdf1KY7aPcBb6QGgC1TLvkp7SSMPvoADoFb3x2HRsn9nqP3rRpyVdX33IFJPTRs57JWdnSQ4oQ7lA12m8VoRqBkFQbK+El+cQnN2rWpjfM6lLPHjV17KgtcMq6xRD2I8+ghTLcJV0UWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPBWvz5JmG3kU6reElf8EYBRks0FH8gGcgJgvb5J1to=;
 b=jOBtL2N/IhPgVEqxuKhIm4AYhMG8q3kS0bXYvCy1GpFF+M7i+o/dPOg3nDoEXdJ9EzmQ9Scle/XpEEPHD3mdDNNfuFxkeV+ibPwRG4bFW+Id3rig5xXIRKuHeCd42EuUdx1dcKB2z6EZEenkIOjv/nl/YTa6C4QkSuddU8kyd3U=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2622.namprd12.prod.outlook.com (52.135.103.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Wed, 4 Sep 2019 09:06:41 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::c4b9:6813:9c58:3fb9%7]) with mapi id 15.20.2220.021; Wed, 4 Sep 2019
 09:06:41 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Topic: [PATCH v2 1/5] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Thread-Index: AQHVYkN4BGZU9s68oUmgIxnYHrVJiKcZzNSAgAAA7zCAASVfAIAAPdNw
Date: Wed, 4 Sep 2019 09:06:40 +0000
Message-ID: <SN6PR12MB26554483310EE0BC00E87EF3AEB80@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567437955.git.vitor.soares@synopsys.com>
 <105a3ac1653e9ae658056a5ec9ddc2a084a61669.1567437955.git.vitor.soares@synopsys.com>
 <20190903111356.GA23588@global.cadence.com>
 <SN6PR12MB2655B0C2E9076EF7187A52F3AEB90@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190904044718.GB23588@global.cadence.com>
In-Reply-To: <20190904044718.GB23588@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3ROR05oTVdaa05tVXRZMlZtTXkweE1XVTVMVGd5TlRjdFlqZ3dPR05t?=
 =?utf-8?B?TlRsa04yWmpYR0Z0WlMxMFpYTjBYRFJqWVRGbVpEWm1MV05sWmpNdE1URmxP?=
 =?utf-8?B?UzA0TWpVM0xXSTRNRGhqWmpVNVpEZG1ZMkp2WkhrdWRIaDBJaUJ6ZWowaU1q?=
 =?utf-8?B?a3dOeUlnZEQwaU1UTXlNVEl3TmpFMU9UZzVOelUyTmpNeklpQm9QU0pZVUdO?=
 =?utf-8?B?bmEzZHpMemxaTWxORFUwcDZNQ3Q1Wnpkd1VIWTBlRUU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJhVVhCTlVFRkhVRlpCVkZGcFRWWkpSR0ZuZEZOT1Ew?=
 =?utf-8?B?bDRWV2RPY1VNeFNVOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e0c6023-99b9-498e-095a-08d73117335b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2622; 
x-ms-traffictypediagnostic: SN6PR12MB2622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB26228131A33E7F947A5A7A8CAEB80@SN6PR12MB2622.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(5660300002)(446003)(102836004)(11346002)(486006)(9686003)(76116006)(66066001)(25786009)(8936002)(64756008)(6506007)(52536014)(305945005)(54906003)(229853002)(110136005)(66476007)(6246003)(66946007)(66556008)(81156014)(99286004)(256004)(26005)(14444005)(8676002)(66446008)(53936002)(316002)(3846002)(6116002)(478600001)(33656002)(14454004)(4326008)(7696005)(74316002)(7736002)(6436002)(81166006)(186003)(6636002)(55016002)(76176011)(476003)(86362001)(2906002)(71200400001)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2622;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eyAD7EJmRxPlU8ng2UrarEi4Fo4u2cVEXUEXPImtQfRL+QMl7/3NStJWa8PQvy4HisiKYgCHwywnoSgvnjmKUfmyPuAupiS4GX+BDsicc2Jc5d00f4kM9mq9Ns3esp90iwI4oP6Ue3foW+Zc/L1dj8mb9gUWjsiEL+AN5761Yqj0WEMObwv7blsKsTmIe4WWwR+1YoaRpN3IbmXOxClpvzFy38101EaL9llw60TAMFpZ10v0YoPUuIg87kms00iuJq32iEi1erBGmYuzzzbscg8s4+FFmgV49i2hva53ffzAGmkVeWeE5mmSI+dd0tjgsiH/GIbP/HH+UHpLolRBWC7qC9UvepDF7L0SyoJTcL0aUw9249ONDw4E0P7mS62baohFTWSQJcu3F6ULZOCWBp2lWKMe7iJxbjI2w/028rQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0c6023-99b9-498e-095a-08d73117335b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 09:06:41.0018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8yUL+S/jgxEDsGCQixDL78j77vPHKTbWMPrX4BupmzQKZkABJtDnfINGzg+n8avv3H0sDN7IdSchOrzNKG13Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2622
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_020645_473880_9806D23E 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 09 Sep 2019 23:39:51 -0700
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 Rafal Ciepiela <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Wed, Sep 04, 2019 at 05:47:18

> The 09/03/2019 11:57, Vitor Soares wrote:
> > EXTERNAL MAIL
> > 
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Tue, Sep 03, 2019 at 12:13:57
> > 
> > > Hi Vitor,
> > > 
> > > I'm sorry for the delay.
> > > 
> > > The 09/03/2019 12:35, Vitor Soares wrote:
> > > > EXTERNAL MAIL
> > > > 
> > > > 
> > > > On pre_assing_dyn_addr() the devices that fail:
> > > >   i3c_master_setdasa_locked()
> > > >   i3c_master_reattach_i3c_dev()
> > > >   i3c_master_retrieve_dev_info()
> > > > 
> > > > are kept in memory and master->bus.devs list. This makes the i3c devices
> > > > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > > > detaching and freeing the devices that fail on pre_assign_dyn_addr().
> > > 
> > > What is the problem with sending devices without dynamic address in DEFSLVS?
> > 
> > How do you address them?
> > For the DA field in DEFSLVS frame, the spec says: "shall contain the 
> > current value of the Slave's assigned 7-bit Dynamic address". If the 
> > device doesn't have the dynamic address assigned yet why send it?
> >
> 
> What stops us from operating with this device in I2C mode using his SA?

So, send it as an I2C device as spec says.

> 
> > > Shouldn't we still inform rest of the devices about that? About fact that
> > > device with SA without DA exists on the bus?
> > 
> > I would like to understand what is the use case for this? 
> 
> Look above. I2C mode still should be possible IMO. Just consider the case when
> you really need some information from that device, main master can assign
> dynamic address later but you can make some transfers.

It is true, but again it is a I2C device and not I3C device. It won't 
reply to I3C commands until has a DA.
How will you know that the DA sent in DEFSLVS is not assigned yet?

> I know our framework
> does not support that case but secondary master can be different system which
> should know that this device exists and don't have DA yet, so I2C mode is
> available.

If the HJ happen in secondary master side, there is a change to describe 
in DT what should be DA. Please check 2nd patch.

> 
> > 
> > On I3C spec table "I3C Devices Roles vs Responsibilities", Secondary 
> > Master is not responsible to do Dynamic Address Assignment but it is 
> > optional to do Hot-Join Dynamic Address Assignment.
> > 
> 
> Yes, we discussed that few times during the review of Mastership patch series.

Hence, based on that table, secondary master won't do DAA just because he 
want, It needs a HJ to trigger DAA.
Sorry, but for me based on what spec says this use case is not feasible. 


Best regards,
Vitor Soares




_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
