Return-Path: <SRS0=MhNy=SM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59442C10F11
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1942133D
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iR3pEYqT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yw7zuhUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1942133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zpgkl9a9Sdr9SVNPg+Iq8HcMVZiTeRcevnzd8FMOEX4=; b=iR3pEYqT1OoA/K
	W61PmMfMh1x9io39Y+v9FgZV6OOUITU7yUvtwFHLjVPcHhadWxvdbBgYLaJXXARwaLqJ6L9iLYJQI
	V3YCRC+IuQJfVUpI+ctNfF0jbU0OFNQfm+gyY0bzd1q2cEnOZ3W9vKXRV+6DAGVF57GEBWrrhEi+9
	KJivRUL804B3ADYywdQ4FRcjGk07MLSMWDrqFQKt7gC8uIHl7GFHwvxw7hxHwGt9TIC/FA0t4mscR
	hwhuXqaUSg0gBcMKCiE8RdqD4IPL1OLtCBsrx86hSqgeGrbdsag5qf/V1JoDJrUAbK8PXgqzQD1IN
	Icu1vv0wzTDGMsQvcLbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEA6v-00071J-Pd; Wed, 10 Apr 2019 10:05:41 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEA6t-00070X-HU
 for linux-i3c@lists.infradead.org; Wed, 10 Apr 2019 10:05:41 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 57FBB24E0E41;
 Wed, 10 Apr 2019 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554890737; bh=pzjgRYeg2YjvHRX9g6h7nIdAhaRXDKApctwOyLobQkE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Yw7zuhUunO7MCSGQKhZc3Qez3xmfPej0enzvWuuIDP9UON7jjh1cmcc93rE8r/DJj
 lQbVLptb6D93AXcqAxAot2gYJTzp+3mDkWAo37c40zNtV/fmvZo6HkyanY1Ibh8N44
 6qJVtJVq22HGcYliQGd56wRSP7BTu8NQDqSXgTOcrUIers+8yiJUop9TL3WLJMbTnL
 PzeTYAT0jP+2JDEID82t4DGIyfa/Gep22FTFJLm23Zv2x3MUi21n94C/RjyEGANIaY
 aTZLUSBrIQGSQyA8zXRxJXsRjbFwX2taUV1Nn3rnsjc5FsFhXoVtwlREUOZgbCPD06
 VEAyx9Fno6rhA==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 40A58A00AB;
 Wed, 10 Apr 2019 10:05:36 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 10 Apr 2019 03:05:35 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Wed, 10 Apr 2019 12:05:33 +0200
From: Vitor Soares <vitor.soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, Vitor Soares <vitor.soares@synopsys.com>
Subject: RE: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHU10l/l7Y/AuF2m06V4TWxPbYeTaYnpPuAgAw6WdCAACAaAIAAIjYggADigwCAAE2IsA==
Date: Wed, 10 Apr 2019 10:05:33 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
 <20190410065339.GB8934@global.cadence.com>
In-Reply-To: <20190410065339.GB8934@global.cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYzI5aGNtVnpYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RNbUU1TWpFME1UWXROV0kzT0MweE1XVTVMVGd5TXpndFpEUTRNV1Ez?=
 =?utf-8?B?T0RVeE9EQm1YR0Z0WlMxMFpYTjBYREpoT1RJeE5ERTNMVFZpTnpndE1URmxP?=
 =?utf-8?B?UzA0TWpNNExXUTBPREZrTnpnMU1UZ3dabUp2WkhrdWRIaDBJaUJ6ZWowaU5q?=
 =?utf-8?B?Z3dPU0lnZEQwaU1UTXhPVGt6TmpRek16RXlPRFl3T0RrNElpQm9QU0pxYURo?=
 =?utf-8?B?V1VuaDFSRkJIVFVoMFV6TkJUVE5aV0c1RVZrcHRTRVU5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGQ1VVcEJRVVJwZW10WWRXaFBMMVZCWXpkaVRtdDVSWFFyZW1ONmRI?=
 =?utf-8?B?TXlWRWxUTXpkT2QwOUJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-originating-ip: [10.107.25.89]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_030539_595120_86A7C2D5 
X-CRM114-Status: GOOD (  25.19  )
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
Date: Wed, Apr 10, 2019 at 07:53:40

> Hi Vitor,
> 
> The 04/09/2019 15:46, Vitor Soares wrote:
> > 
> > Hi Przemek,
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Tue, Apr 09, 2019 at 16:20:30
> > 
> > > Hi Vitor,
> > > 
> > > The 04/09/2019 14:31, Vitor Soares wrote:
> > > > 
> > > > Hi Przemek,
> > > > 
> > > > From my analyses you do i3c_master_register for secondary master in follow 
> > > cases:
> > > > - HC has already an dynamic address and it is the owner of the bus.
> > > 
> > > Correct. It requests bus ownership before registration, if DA is assigned.
> > > 
> > > > Or 
> > > > - when it receive MR event enabled
> > > 
> > > Actually, when MR event is enabled and secondary master is not initialized 
> > > yet.
> > 
> > I didn't find where you do this verification, can you point me?
> 
> In the driver, cdns_i3c_sec_master_event_up(). I'm requesting mastership and
> registering the master when event is enabled and master is not registered yet.
> 

Sorry, I really don't see that. I assume it is some logic in the 
controller.

> > 
> > > 
> > > > 
> > > > Is this correct?
> > > > 
> > > > From: vitor <soares@synopsys.com>
> > > > Date: Mon, Apr 01, 2019 at 19:41:39
> > > > 
> > > > > Hi Przemek,
> > > > > 
> > > > > > +/**
> > > > > >   * i3c_master_register() - register an I3C master
> > > > > >   * @master: master used to send frames on the bus
> > > > > >   * @parent: the parent device (the one that provides this I3C master
> > > > > >   *	    controller)
> > > > > >   * @ops: the master controller operations
> > > > > > - * @secondary: true if you are registering a secondary master. Will 
> > > return
> > > > > > - *	       -ENOTSUPP if set to true since secondary masters are not yet
> > > > > > - *	       supported
> > > > > > + * @secondary: true if you are registering a secondary master.
> > > > > >   *
> > > > > >   * This function takes care of everything for you:
> > > > > >   *
> > > > > > @@ -2427,10 +2672,6 @@ int i3c_master_register(struct 
> > > i3c_master_controller 
> > > > > *master,
> > > > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > > > >  	int ret;
> > > > > >  
> > > > > > -	/* We do not support secondary masters yet. */
> > > > > > -	if (secondary)
> > > > > > -		return -ENOTSUPP;
> > > > > > -
> > > > > >  	ret = i3c_master_check_ops(ops);
> > > > > >  	if (ret)
> > > > > >  		return ret;
> > > > 
> > > > The bus mode is set before the sec master does 
> > > i3c_master_add_i3c_dev_locked() and
> > > > i3c_master_add_i2c_dev() and after that it isn't updated. This can cause 
> > > troubles for
> > > > HDR-TS modes and when you have i2c devices INDEX(2) on the bus.
> > > 
> > > Yes, I see this now. It may happen before HC driver updates device list. I
> > > should update device list right before i3c_master_register().
> > > 
> > > > 
> > > > > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct 
> > > i3c_master_controller 
> > > > > *master,
> > > > > >  	 * register I3C devices dicovered during the initial DAA.
> > > > > >  	 */
> > > > > >  	master->init_done = true;
> > > > > > -	i3c_bus_normaluse_lock(&master->bus);
> > > > > > -	i3c_master_register_new_i3c_devs(master);
> > > > > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > > > > +	i3c_master_register_new_devs(master);
> > > > > > +
> > > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > > +	i3c_master_enable_mr_events(master);
> > > > 
> > > > Why are you enabling MR events here? As a standard function this might case 
> > > issues
> > > > because the master can support ENEC/DISEC commands but not multi-master 
> > > typologies.
> > > 
> > > I enable it at the end of master registration to be sure that current master 
> > > is
> > > ready for bus mastership relinquish. If controller does not support secondary
> > > master role it can just do nothing with it.
> > 
> > I think it isn't good idea to have this here because you are forcing HC driver to
> > verify it. If it is to be done in subsystem side probably it is better to have a
> > master/slave functionalities structure.
> 
> If multi-master topology is not supported, request_mastership() hook won't be
> implemented and also you will not implement enable/disable_mr_events() hooks.
> You don't have to verify it in the driver.

In that case we will need a driver for each role/set of available 
features and duplicate the code otherwise this need to be checked in HC 
side.

> 
> > 
> > > 
> > > > 
> > > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > >  
> > > > > >  	return 0;
> > > > > >  
> > > > > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct 
> > > i3c_master_controller 
> > > > > *master,
> > > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > > >  
> > > > 
> > > > I'm thinking if isn't better to instantiate the bus apart and them register 
> > > the secondary master.
> > > 
> > > It looked like that before but we decided to register everything or nothing.
> > 
> > I see your point, but for the future, slave implementation, we can have a
> > function to instantiate just the bus and another for master or slave.
> > 
> 
> We can go the same way with slave, and register bus and slave at once. If this
> is the case.

What if the slave is a secondary master? In your opinion what should be 
the flow?

> 
> > > 
> > > > In this way you are able to add DEFSLVS even before the HC has enable MR 
> > > events like it is done
> > > > with dt devices.
> > > 
> > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > from
> > > current master right after ENTDAA. Could you please explain?
> > 
> > So the current master receive an hot join and send the DEFSLVS, when do you
> > add them to the bus? Will you go for the all process to get all dev info and so on?
> > 
> 
> When current master receives an hot-join, do ENTDAA to enumerate device which
> joined the bus and then sends DEFSLVS. This data is stored in secondary master
> controller and if secondary master can request mastership, collects all
> required informations and adds the devices. It has to collect PID, DEFSLVS does
> not provide this information.

I see now. You need to take care here because when the secondary master 
add the i3c_dev it might change the address.
This is one of the reasons I would prefer a dedicated function to add the 
DEFSLVS.

Another point is what happen if the current master received MR request 
during this registration?

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
