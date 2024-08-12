Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56140C52D7C
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Aug 2024 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcJ/ZSQvhQ73ish00AfK4r4s8/p4xF2xwSXGGLR3iRc=; b=z7+mpvtbsIP5cw
	Y+NtGFU/CeEbazXrgoSsAIOl0Th7J9l0yKFFwtPUkiM+EXosu7jtgghRvjOjQ8hbOv1cKy5t2P1N9
	fXOdAGmy/lYJg4ANkJ8/EKjdkiAT8D5k77HTWk9b9u/2rKIff92yeulE+9mFXUfjQvy2Box23bkbw
	v8jw0UfVFpVD3lbEMgN+jv+O7SS45KRgn8mQgq+/HdIhY7yQkybL/rEoLUQXwmUw4drlqPgtjCn3o
	jqKRTcmHSUfvyYCqnxcqBUzdb2XhGIDoIOZzP5eADuRtoXOE/uwYoRFrB+tSgt3Wz7HH/3jXgooE+
	2uqCyxVBDFRgVBpkGnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRBL-0000000HQFu-38Em;
	Mon, 12 Aug 2024 09:17:39 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRBA-0000000HQCn-018p
	for linux-i3c@lists.infradead.org;
	Mon, 12 Aug 2024 09:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723454249; x=1754990249;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lz63Dfwp5XIblLwOcTkihhV7G1CgponampdWZ030ARQ=;
  b=JXAVMi/CSfTxljR8MgaId+1L7hLlfa+K4Jk1F2ph2jevCeOUiV49MDkZ
   Iz0HACC5kcESNKDYZoWEiQ2egVFFec7lXykWWIe5PgX/d/XPeYAnq2DNZ
   y0n1zP/u9uih92pVzaIVKc2RhFgDzIsMWZ7OHDg8wkhCQeEGlJvmNZlsY
   szuFk1gQKtS9UhRFjWoV0zUqf/c94EfFlSK37majw26UJDXpyDBDNcFE8
   JPSKTNhKx172Nli5XkpVcFWoeIONx6VT04XbOpbINaNG75dz/soLZZxZ9
   BoMOV3YISy54DgJd257QBNGmoWT628/ak+2nfS27txSky3TL0iPI6MdSf
   g==;
X-CSE-ConnectionGUID: DcRKF3OxSSGB0x+ueg2vDw==
X-CSE-MsgGUID: +2FbYLN3S5K4HqYiyH9eMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21682924"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21682924"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:17:26 -0700
X-CSE-ConnectionGUID: h4aY31XiTmqfG1wEPsXCVQ==
X-CSE-MsgGUID: 5fcwkgH5R0uOLnCedJumeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="95712182"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2024 02:17:23 -0700
Message-ID: <0ae18e57-ef79-4fd8-9e9a-4c57b480b267@linux.intel.com>
Date: Mon, 12 Aug 2024 12:17:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO
 mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
 <2a9f6c23-9c7b-496b-9998-ea0afe526b46@linux.intel.com>
 <94e789ab-2e64-4a6e-804f-b5e7b2a952cb@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <94e789ab-2e64-4a6e-804f-b5e7b2a952cb@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_021728_116377_7348767A 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkKCk9uIDgvOS8yNCA2OjQ0IFBNLCBTaHlhbSBTdW5kYXIgUyBLIHdyb3RlOgo+PiBJIHdhcyB0
aGlua2luZyB0aGVzZSBxdWlya3MgY2FuIGJlIHBhc3NlZCBhcyBkcml2ZXJfZGF0YSBtb3JlIGNs
ZWFubHkKPj4gYW5kIGJlIHNwZWNpZmljIG9ubHkgdG8gYWZmZWN0ZWQgSFcgaWYgQU1EIEhXIHdv
dWxkIGhhdmUgYW4gdW5pcXVlCj4+IEFDUEkgSUQgZm9yIGVhY2ggSFcgdmVyc2lvbi4KPj4KPj4g
QWJvdmUgWDg2X1ZFTkRPUl9BTUQgbWlnaHQgYmUgdG9vIGdlbmVyaWMgaWYgYW5kIHdoZW4gcXVp
cmtzIGFyZSBmaXhlZAo+PiBpbiB0aGUgZnV0dXJlIEhXIDotKQo+Pgo+PiBTbyBzb21ldGhpbmcg
bGlrZToKPj4KPj4gc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBpM2NfaGNpX2Fj
cGlfbWF0Y2hbXSA9IHsKPj4gIMKgwqDCoMKgeyJBTURJMTIzNCIsIEhDSV9RVUlSS19QSU9fTU9E
RSB8IEhDSV9RVUlSS19PRF9QUF9USU1JTkcgfAo+PiBIQ0lfUVVJUktfUkVTUF9CVUZfVEhMRH0s
Cj4+ICDCoMKgwqDCoHt9Cj4+IH07Cj4+Cj4+IGFuZCBzZXQgdGhlbSBpbiB0aGUgaTNjX2hjaV9w
cm9iZSgpIGFzOgo+Pgo+PiBoY2ktPnF1aXJrcyA9ICh1bnNpZ25lZCBsb25nKWRldmljZV9nZXRf
bWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAKPiBOaWNlIGlkZWEuIEJ1dCBvbmx5IHByb2JsZW0g
aXMgdGhhdCBNU0ZUIHdhbnRzIHRvIGhhdmUgdGhlIHNhbWUgQUNQSQo+IElEIHByZXNlbnQgaW4g
dGhlIHNwZWNpZmljYXRpb24uCj4gCj4gSSBoYXZlIHJlcGxpZWQgdG8gQW5keSBvbiBwYXRjaCAx
LzYuIENhbiB5b3UgcGxlYXNlIHB1dCB5b3VyIHJlbWFya3MKPiB0aGVyZT8KPiAKV2VsbCB0aGlz
IGlzIGltcGxlbWVudGF0aW9uIGRldGFpbCBsYXRlciBpbiB0aGUgc2VyaWVzIGFuZCBJIGZvdW5k
IGl0IApiZXR0ZXIgdG8gZm9jdXMgQUNQSSBJRCBkaXNjdXNzaW9uIGluIDEvNi4KCj4gWWVhaCwg
YWdyZWVkIHRoYXQgaGF2aW5nIFg4Nl9WRU5ET1JfQU1EIGlzIHRvbyBnZW5lcmljLCBidXQgZmVs
dCBpdHMKPiBnb29kIHRvIGhhdmUgYWRkaXRpb25hbCBjaGVja3Mgb25seSBhZnRlciB0aGUgSFcg
aXMgZml4ZWQsIHJhdGhlciB0aGFuCj4gYmVpbmcgc3BlY3VsYXRpdmUgbm93Li4gOi0pCj4gCj4g
V2hhdCB3b3VsZCB5b3UgYWR2aXNlPwo+IE1vc3QgcHJvYmFibHkgdGhlcmUgd2lsbCBiZSBmdXR1
cmUgSFcgd2l0aCBlaXRoZXIgZXhhY3RseSBzYW1lIHNldCBvZiAKcXVpcmtzLCByZWR1Y2VkIHF1
aXJrcyBvciBuZXcgcXVpcmtzIGFuZCBYODZfVkVORE9SX0FNRCB0ZXN0IHdpbGwgd29yayAKb25s
eSB3aXRoIHRoZSBmaXJzdCBjYXNlIDotKQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
