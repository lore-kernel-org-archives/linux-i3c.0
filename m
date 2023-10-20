Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC60C0032E
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RTemgJr3p+4E5gN3wx8shOF/KV+loFJHSSNKIv43AY=; b=Qrurux9Bc9FXsG
	+Mk0RRmWH8k0TdrG+JhMYF1ZoUxiyu1b6Rt9sDgSD5DiF717PEzoVQzJKG/XL5CUVUbu0fX6/B1IQ
	bnIIL5DxOSLqrPa6fs09hcINt1/NDWwDX5cvuXKJAE44T3/1QWlbEzxLl51w2ODW1zhjjQl4EOncW
	REZfuamrH0PosocQpzvWUAFUK+W5bYnNjF98+4Gqn8RiRMQey9gujuMRYUwhsocM9zhnO5F//Rvwa
	QkGiR1WoQdygjknDJcX9oLrW1KsgTXlPB22PMiWFISqckD3u+9BrQmJV3p+mADRUkfSp4lMfXufEG
	ZJjW07IFMWsxbzwFVJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtwKG-002ztM-1e;
	Fri, 20 Oct 2023 20:42:32 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtwKD-002zs5-1n
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 20:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697834549; x=1729370549;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ecmwPBJzBiIjr2BFx4ObYSrBmisVgxOUXbZjBhAlk5g=;
  b=KRxHfKWg8JOpF8uP86YOzluu0xqC1fkhfuLx0EtHZPVfAKgtX0lbcX/r
   5AJQWPzOCedUOeelY0OXVcDRQxdg2mXgwRVgjTooY1HSr7RAzPDX+mVwT
   YDoc54UrDSTYXcgvHhVfYGHdCr9mjGZj7acqwbCTmq9lKsSFgfTJWHxOe
   a0HMer+kAakn5CJdZCdd1ZG6Kc4lW3saJD6oiDQwrmnHjhmTAw1xKM6X0
   DftRsbvn617+9zSRO1/qivlAxMj06v2AGo+wQKxH4+EPP6s9fiLx/AKcs
   TfccG7/34B/LAU8o9/NAnzt67UKaI0tooaM/cLHU1BBWg+EqTnuE39CpC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389425162"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389425162"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881177232"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="881177232"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:42:24 -0700
Received: from [10.252.63.39] (jbyczkow-MOBL1.ger.corp.intel.com [10.252.63.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 816E1580D4F;
	Fri, 20 Oct 2023 13:42:22 -0700 (PDT)
Message-ID: <86955c20-22e6-0d02-813f-02f0096c2819@linux.intel.com>
Date: Fri, 20 Oct 2023 22:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
 <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
 <20231020154528.2f5f68f5@xps-13>
 <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
 <20231020163348.1752167d@xps-13>
 <8a7ac52e-f102-6f5e-35ab-217e6ecc6ba5@linux.intel.com>
 <20231020202519b2449707@mail.local>
 <ZTLktpI2rbAT4Ztb@lizhi-Precision-Tower-5810>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <ZTLktpI2rbAT4Ztb@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_134229_639108_21A814FE 
X-CRM114-Status: GOOD (  21.94  )
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

T24gMTAvMjAvMjAyMyAxMDozNiBQTSwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjAs
IDIwMjMgYXQgMTA6MjU6MTlQTSArMDIwMCwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6Cj4+IE9u
IDIwLzEwLzIwMjMgMTc6MTI6NTMrMDIwMCwgWmJpZ25pZXcsIEx1a3dpbnNraSB3cm90ZToKPj4+
IE9uIDEwLzIwLzIwMjMgNDozMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+PiBIaSBGcmFu
aywKPj4+Pgo+Pj4+IEZyYW5rLmxpQG54cC5jb20gIHdyb3RlIG9uIEZyaSwgMjAgT2N0IDIwMjMg
MTA6MjA6NTcgLTA0MDA6Cj4+Pj4KPj4+Pj4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMDM6NDU6
MjhQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+IEhpIEx1a3dpbnNraSwKPj4+
Pj4+Cj4+Pj4+PiB6Ymlnbmlldy5sdWt3aW5za2lAbGludXguaW50ZWwuY29tICB3cm90ZSBvbiBG
cmksIDIwIE9jdCAyMDIzIDEwOjU1OjI3Cj4+Pj4+PiArMDIwMDoKPj4+Pj4+PiBPbiAxMC8xOC8y
MDIzIDEwOjU5IFBNLCBGcmFuayBMaSB3cm90ZToKPj4+Pj4+Pj4gQWRkIGhvdGpvaW4gZW50cnkg
aW4gc3lzIGZpbGUgc3lzdGVtIGFsbG93IHVzZXIgZW5hYmxlL2Rpc2FibGUgaG90am9pbgo+Pj4+
Pj4+PiBmZWF0dXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBZGQgKCplbmFibGUoZGlzYWJsZSlfaG90
am9pbikoKSB0byBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzLgo+Pj4+Pj4+PiBBZGQgYXBpIGkz
Y19tYXN0ZXJfZW5hYmxlKGRpc2FibGUpX2hvdGpvaW4oKTsKPj4+Pj4+PiBXaGF0IGlzIHRoZSB1
c2UgY2FzZSBmb3IgaGF2aW5nIEhKIGVuYWJsZSBrbm9iIGluIHN5c2ZzIGF2YWlsYWJsZSBmb3Ig
dXNlciBzcGFjZSBvdGhlciB0aGFuIGZvciBkZWJ1ZyBzdHVmZj8gSW4gb3RoZXIgd29yZHMsIGRv
ZXMgdXNlciBzcGFjZSByZWFsbHkgbmVlZCB0byBlbmFibGUvZGlzYWJsZSBISiBpbiBydW50aW1l
IGZvciBvdGhlciByZWFzb24gYnV0IGRlYnVnPyBJZiBpdCBpcyBvbmx5IGZvciBkZWJ1ZyBtYXli
ZSBpdMKgIGNvdWxkIGJlIG1vdmUgdG8gZGVidWdGUz8KPj4+Pj4+IEkgZG9uJ3QgdGhpbmsgaG90
am9pbiBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyBhIGRlYnVnIGZlYXR1cmUuIFRoZQo+Pj4+Pj4g
cHJvYmxlbSBoZXJlIGlzIHRoZSBwb3dlciBjb25zdW1wdGlvbiB3aGljaCBpcyBoaWdoZXIgaWYg
eW91IGVuYWJsZQo+Pj4+Pj4gdGhpcyBmZWF0dXJlICh5b3UgbmVlZCB0byBrZWVwIGV2ZXJ5dGhp
bmcgY2xvY2tlZCBhbmQgcmVhZHkgdG8gaGFuZGxlCj4+Pj4+PiBhbiBJQkkpIHdoZXJlYXMgaWYg
eW91ciBkZXNpZ24gaXMgImZpeGVkIiAobW9yZSBsaWtlIGFuIEkyQyBidXMpIHlvdQo+Pj4+Pj4g
bWF5IHNhdmUgcG93ZXIgYnkgZGlzYWJsaW5nIHRoaXMgZmVhdHVyZS4KPj4+Pj4+Cj4+Pj4+PiBB
IG1vZHVsZSBwYXJhbWV0ZXIgZG9lcyBub3QgZml0IGhlcmUgYmVjYXVzZSBpdCdzIGEgcGVyLWJ1
cwo+Pj4+Pj4gY29uZmlndXJhdGlvbi4KPj4+Pj4gSSBhZ3JlZS4gc3lzIGVudHJ5IGlzIG1vcmUg
ZmxleGlhYmxlLiBhbmQgbGV0IGNvbnRyb2xsZXIgY2hvb3NlIGJldHRlcgo+Pj4+PiBwb3dlciBz
YXZpbmcgcG9saWN5IGZvciBkaWZmZXJlbmNlIHVzZXIgY2FzZS4KPj4+PiBNYXliZSBpdCdzIG5v
dCB0aGUgZmlyc3QgdGltZSB0aGlzIGNhc2UgaXMgZmFjZWQsIHdvdWxkIHlvdSBtaW5kCj4+Pj4g
aW5jbHVkaW5nIHBvd2VyIG1hbmFnZW1lbnQgbWFpbnRhaW5lcnMgaW4gdGhpcyBkaXNjdXNzaW9u
PyBQZXJoYXBzIHRoZXkKPj4+PiBtaWdodCBoYXZlIHBvaW50ZXJzIG9yIGV2ZW4gaGF2ZSB0aGUg
c29sdXRpb24gYWxyZWFkeS4KPj4+Cj4+PiBJIGRpZCBub3QgbWluZCBISiBhcyBkZWJ1ZyBmZWF0
dXJlLiBCdXQgZW5hYmxpbmcgLyBkaXNhYmxpbmcgdGhlIEhKIHNvdW5kcwo+Pj4gdG8gbWUgbGlr
ZSBkZWJ1ZyBvcHRpb24uCj4+Pgo+Pj4gU28gdGhlIGZsb3cgeW91IGFyZSBjb25zaWRlcmluZyBo
ZXJlIGlzIGxpa2UgdGhpczo/Cj4+Pgo+Pj4gICAgICAxLiBzeXN0ZW0gYm9vdCB3aXRoIEhKIGVu
YWJsZWQsIHNvIEhKIHdvcmtzIGR1cmluZyBpbml0aWFsIGJ1cwo+Pj4gICAgICAgICBkaXNjb3Zl
cnkKPj4+ICAgICAgMi4gc29tZSBlbnRpdHkgaW4gdXNlciBzcGFjZSBkZWNpZGVzIHRvIGRpc2Fi
bGUgSEogYmVjYXVzZSBwb3dlcgo+Pj4gICAgICAgICBjb25zdW1wdGlvbj8KPj4+ICAgICAgMy4g
c29tZSBlbnRpdHkgaW4gdXNlIHNwYWNlIGRlY2lkZSBzb21lIHRpbWUgbGF0ZXIgdG8gcmUtZW5h
YmxlIEhKCj4+PiAgICAgICAgIGJlY2F1c2Ugc29tZSByZWFzb24/Cj4+Pgo+Pj4gSSBhbSBqdXN0
IHdvbmRlcmluZyB3aGV0aGVyIHRoZXJlIGlzIHJlYWwgdXNlIGNhc2Ugd2hlbiB5b3Ugc3RhcnRz
IHdpdGggSEoKPj4+IGVuYWJsZWQgYW5kIHRoYW4gZGlzYWJsZSBpdAo+IAo+IEkgdGhpbmsgaXQg
aXMgdmFsaWRhdGUgdXNlciBjYXNlLiBBc3N1bWUgYSBJM0MgR1BTIGRldmljZSwgdXNlciBvbmx5
IHVzZQo+IGl0IHdoZW4gb3BlbiBtYXAuIEJlZm9yZSBtYXAgYXBwbGljYXRpb24gb3BlbiwgZW5h
YmxlIGkzYyBob3Rqb2luIGFuZAo+IHBvd2VyIG9uIEdQUyBtb2R1bGUuIEFmdGVyIG1hcCBhcHBs
aWNhdGlvbiBjbG9zZSwgZGlzYWJsZSBpM2MgaG90am9pbiBhbmQKPiBwb3dlciBvZmYgR1BTIG1v
ZHVsZS4KPiAKR290IGl0LiBJIHRoaW5rIHdlIGFyZSBvbiB0aGUgc2FtZSBwYWdlLiBUaGFua3Mg
Zm9yIGV4cGxhbmF0aW9ucyEKPiBGcmFuawo+IAo+Pj4KPj4+IGluIHJ1bnRpbWUgb3Igc3RhcnQg
d2l0aCBISiBkaXNhYmxlZCBhbmQgZW5hYmxlIGl0IGluIHJ1bnRpbWUuIElmIHlvdSBhcmUKPj4+
IHRha2luZyBjYXJlIGFib3V0IHBvd2VyIHNhdmluZwo+Pj4KPj4+ICDCoGxldCdzIGtlZXAgSEog
ZGlzYWJsZWQgYWxsIHRoZSB0aW1lLiBEZWZhdWx0IHN0YXRlIGZvciBISiBjb3VsZCBiZQo+Pj4g
Y29udHJvbGxlZCBieSBEVCBlbnRyeS4KPj4+Cj4+Cj4+IFRoaXMgd291bGQgYmUgSFcgY29uZmln
dXJhdGlvbiBhbmQgbm90IEhXIGRlc2NyaXB0aW9uLgo+IAo+IFllcywgRFQgbWFpbnRhaW5lciBt
YXkgbm90IGFjY2VwdCB0aGlzIGVudHJ5IGJlY2F1c2UgaXQgaXMgbm90IEhXCj4gZGVzY3JpcHRp
b24uCj4gClN1cmUuIE1ha2VzIHNlbnNlLgo+Pgo+Pgo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTWlx
dcOobAo+Pgo+PiAtLSAKPj4gQWxleGFuZHJlIEJlbGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJv
b3RsaW4KPj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+PiBodHRwczov
L2Jvb3RsaW4uY29tCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
