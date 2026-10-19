Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0DDCCF2DA
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NtQyjh+s6NV6Rodeg856EQWoNt9MFzxyaVl5ECabF8=; b=D/wJljdzLUG7QI
	zufY19N6kNSy78yTJvgGtdRE3hkH2uFyRxwWaPIfvSE4K9Rl/hxpPItLLT8JNyZyYPDGGk4sR3uWq
	j5QMayiLYSGaVHGb0tonwLL7rzmPF0wBX5v0S37j7CTQ4UNckgchTmIuV/mcjHCbk1oy70vFL1gfG
	Rwsz24yWa6+8qHADyPBI08uFcdNLqCk3mEBMZFSe1ndYelrkxWYlDeKoILWyXjGhLEy1XUxs516vT
	T1nejEiR/1ipBqhlEhJKjhNFtm9KNKChiWjhFhMSDd+4vVJ+bYx4Aqk6i5I6fdMFtHPKwH2EGF41K
	r3SbHz3REVKcoFFbuWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvi-000000072zV-0oHi;
	Mon, 19 Oct 2026 09:45:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvd-000000072vz-2KIU
	for linux-i3c@lists.infradead.org;
	Mon, 19 Oct 2026 09:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792403113; x=1823939113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w4UHhObpYApuoYUrGBdsgMQGLO/WGyYDONI7l3vgqfk=;
  b=G8BXrwqSZnNKNNVP2cpL5Pz0hhZfaqIYm072zirSyrNjAmUoq3V5swFC
   AUR3i0xERt/g+bY3lNkgC5TW+aAMUguyyav3EacIM325U9oaMJ0qUP6YC
   31425i06j4vZdUtJgHEX7Efbvlb7MX/yigrNX+LgqNioK/o0LWVhoWQRw
   ZOcXl9kdoZHGh0V/HqDdnrHHdADS/NN8t+8TQyACkp4NRdXngM8OMmjG6
   +6+asn9qNBRVOOMTuj40DRzAg4DKeppdzgWJk5bwNmZMqgk4Sda78u+so
   BjTyHQohFfEZeRF0emOLczBkR5KTaB6yRW3Clh/PRCDdGXs4g9lMACLXF
   w==;
X-CSE-ConnectionGUID: /0I2OmYVQ+yZxf1rgEWEXA==
X-CSE-MsgGUID: VCnOBxX5RuWvOCkZApd+kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="983659"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="983659"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:45:11 -0700
X-CSE-ConnectionGUID: PJQrtk4pTXW/F4y7qXJNDw==
X-CSE-MsgGUID: 4Ld0QSQnS6WRwwsnxgvfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4252753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:45:09 -0700
Date: Mon, 19 Oct 2026 12:45:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <atXmovzepBLP8Mqo@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_024513_622806_24E50701 
X-CRM114-Status: GOOD (  31.80  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMDE6Mjg6NDRQTSAtMDcwMCwgU2FtIEFnYXphcnlhbiB3
cm90ZToKPiA+IFllcyBhbmQgbW9yZSBhcyB0aGlzIGJ1cyAoaTNjKSBpcyBzdGlsbCBub24tZGlz
Y292ZXJhYmxlIChhbSBJIG1pc3Rha2VuPykuCj4gCj4gSTNDIGlzIGEgZHluYW1pY2FsbHkgZGlz
Y292ZXJhYmxlIGJ1cy4gRHVyaW5nIERBQSBlYWNoIEkzQyB0YXJnZXQgcmVwb3J0cyBhCj4gUHJv
dmlzaW9uZWQgSUQgKFBJRCksIEJ1cyBDaGFyYWN0ZXJpc3RpYyBSZWdpc3RlciAoQkNSKSwgYW5k
IERldmljZQo+IENoYXJhY3RlcmlzdGljIFJlZ2lzdGVyIChEQ1IpLCBhbmQgaXMgYXNzaWduZWQg
YSBkeW5hbWljIGFkZHJlc3MgYnkgdGhlCj4gY29udHJvbGxlci4KCkRpZCBJIG1pc3MgdGhpcyBp
biB0aGUgaW5pdGlhbCBleHBsYW5hdGlvbj8gSWYgbm90LCBwbGVhc2UgYWRkIGl0IG5leHQgdGlt
ZS4KCj4gPiBUaGlzIG1ha2VzIGV2ZW4gbGVzcyB1c2VmdWxuZXNzIGluIG15IGV5ZXMuIEltbWVk
aWF0ZSBROiBpZiA0IGFscmVhZHkgaGF2ZSB0aGUKPiA+IHByb3BlciBkcml2ZXIgaW4gdGhlIGtl
cm5lbCwgd2hhdCdzIHdyb25nIHRvIG1ha2UgaXQgZm9yIHRoZSBmaWZ0aCBvbmU/Cj4gCj4gMS4g
VGhlIG9yaWdpbmFsIHVzZSBjYXNlIHdhcyBoYXJkd2FyZSBicmluZy11cCwgc2lsaWNvbiB2YWxp
ZGF0aW9uLCBhbmQgZGVidWcKPiAoaTNjdHJhbnNmZXIpOiBKdXN0IGxpa2Ugc3BpZGV2LCBlbmdp
bmVlcnMgbmVlZCBhIGRlYnVnIGludGVyZmFjZQo+IHRvIGlzc3VlIGFkLWhvYyBTRFIvSERSIHRy
YW5zZmVycyBkdXJpbmcgYnJpbmctdXAgb3IgaGFyZHdhcmUgdmFsaWRhdGlvbiBiZWZvcmUKPiBh
IGRyaXZlciBleGlzdHMuCgpUb3RhbGx5IGRlYnVnIGZlYXR1cmUgdG8gbWUuIE9uY2UgeW91IGV4
cG9zZSBzb21ldGhpbmcgaW4gL2RldiAoaW1wbHkgSU9DVEwpLAppdCB3aWxsIGJlY29tZSBhbiBB
QkkuIEFuZCBJJ20gZnVsbHkgYWdhaW5zdCB0aGlzLgoKPiAyLiBVc2Vyc3BhY2UgZmlybXdhcmUg
cmVjb3ZlcnkgLyB1cGRhdGUgdG9vbHMgKE9DUCBTZWN1cmUgRmlybXdhcmUKPiBSZWNvdmVyeSwg
Q2FsaXB0cmEgUm9UKToKPiBUaGUgcmVjb3ZlcnkgcHJvdG9jb2wgaXMgcHVyZWx5IGEgcG9sbGVk
IHJlcXVlc3QvcmVzcG9uc2UgdHJhbnNwb3J0Cj4gKG5vIElCSXMgYWxsb3dlZCBwZXIgc3BlYykg
dXNlZCBieSB1c2Vyc3BhY2UgdXBkYXRlIHRvb2xpbmcgKGZ3dXBkIC8gQk1DCj4gcmVjb3Zlcnkg
ZGFlbW9ucykgdG8gcGFyc2Ugc2lnbmVkIGZpcm13YXJlIG1hbmlmZXN0cywgc3RyZWFtIHJlY292
ZXJ5IGltYWdlCj4gY2h1bmtzIHRvIElORElSRUNUX0ZJRk9fREFUQSwgYW5kIHBvbGwgUkVDT1ZF
UllfU1RBVFVT4oCUc2ltaWxhciB0byBob3cKPiB1c2Vyc3BhY2UgZmlybXdhcmUgdXBkYXRlcnMg
b3BlcmF0ZSBvdmVyIHNwaWRldiwgaGlkcmF3LCBvciBVU0IvTlZNZSBpb2N0bHMKPiByYXRoZXIg
dGhhbiBwdXR0aW5nIGZpcm13YXJlIGltYWdlIHBhcnNpbmcgYW5kIHVwZGF0ZSBwb2xpY3kgaW5z
aWRlIHRoZQo+IGtlcm5lbC4gSW4gbXkgcmVzcG9uc2UgdG8gV29sZnJhbSBhYm92ZSBJIGRpc2N1
c3NlZCB0aGlzIHNvbWUgbW9yZS4KCkRvIHdlIGhhdmUgc3VjaCB1c2UgY2FzZXMgSVJMPyBEbyB3
ZSBoYXZlIHRvb2xpbmcgc3VwcG9ydCAoYXQgbGVhc3QgcGVuZGluZykKc29tZXdoZXJlPyBXaHkg
ZG9lcyBpdCByZXF1aXJlIHVzZXIgc3BhY2UgaW50ZXJhY3Rpb24gaW4gX3RoaXNfIHdheSAobWVh
bmluZwpJT0NUTCBhbmQgL2RldiBub2RlKT8KCj4gPiBXaGF0IGlmIHRoZSBkZXZpY2UgbmVlZHMg
bW9yZT8gT3IgaWYgdGhpcyBpcyBhIG11bHRpLWZ1bmN0aW9uYWwgZGV2aWNlIHRoYXQKPiA+IG1h
eSBoYXZlIGRyaXZlciBmb3Igb25seSBvbmUgcGFydD8KPiAKPiBJZiBhIGRldmljZSBuZWVkcyBt
b3JlIHRoYW4gYmFzaWMgdHJhbnNmZXJzIChzdWNoIGFzIElCSXMsCj4gaG90LWpvaW4gaGFuZGxp
bmcsIG9yIGludGVncmF0aW9uIHdpdGggYSBzdWJzeXN0ZW0gbGlrZSBod21vbi9paW8vbWN0cCks
Cj4gaXQgc2hvdWxkIHVzZSBhIGRlZGljYXRlZCBrZXJuZWwgZHJpdmVyLgo+IAo+IEZvciBtdWx0
aS1mdW5jdGlvbiBkZXZpY2VzLCBpZiB0aGUgZnVuY3Rpb25zIGFyZSBleHBvc2VkIGFzIE1JUEkg
STNDCj4gVGFyZ2V0cyAoZS5nLiBhIGRldmljZSBleHBvc2luZyBib3RoIGFuIG1jdHAtaTNjIGlu
dGVyZmFjZSBhbmQKPiBhbiBPQ1AgcmVjb3ZlcnkgaW50ZXJmYWNlKSwgZWFjaCB2aXJ0dWFsIHRh
cmdldCBpcyBhc3NpZ25lZCBpdHMgb3duCj4gZHluYW1pYyBhZGRyZXNzIGFuZCBEQ1IgZHVyaW5n
IEVOVERBQSBhbmQgaXMgZW51bWVyYXRlZCBhcyBhIGRpc3RpbmN0Cj4gaTNjX2RldmljZSBpbnN0
YW5jZSBvbiB0aGUgYnVzLiBDb252ZXJzZWx5LCBpZiBtdWx0aXBsZSBmdW5jdGlvbnMgc2hhcmUK
PiBhIHNpbmdsZSBJM0MgdGFyZ2V0IGFkZHJlc3MgYW5kIHJlZ2lzdGVyIG1hcCwgaTNjZGV2IGlu
dGVudGlvbmFsbHkgZG9lcwo+IG5vdCBhbGxvdyB1c2Vyc3BhY2UgdG8gYWNjZXNzIGEgdGFyZ2V0
IHdoaWxlIGEga2VybmVsIGRyaXZlciBpcyBib3VuZAo+IHRvIGl0IChhdm9pZGluZyB0aGUgSTJD
X1NMQVZFX0ZPUkNFIHByb2JsZW0gd2hlcmUgdXNlcnNwYWNlIGNhbiByYWNlCj4gd2l0aCBhIGJv
dW5kIGRyaXZlciksIHNvIHRoYXQgY2FzZSBzaG91bGQgYmUgaGFuZGxlZCBieSBhbiBpbi1rZXJu
ZWwKPiBNRkQgZHJpdmVyIC0gYnV0IHRoYXQgaXMgbm90IHRoZSB1c2UgY2FzZSBiZWluZyB0YXJn
ZXRlZCBoZXJlIHdpdGggT0NQCj4gcmVjb3ZlcnkuCgpTbywgaW1hZ2luZSB0aGF0IHNvbWVvbmUg
c3VibWl0cyBhIGtlcm5lbCBkcml2ZXIgZm9yIGEgc2ltcGxlIGRldmljZSwgd2hpbGUKYW5vdGhl
ciBwZXJzb24gYWxyZWFkeSB1c2VzIHRoZSBkcml2ZXIgZm9yIG11bHRpLWZ1bmN0aW9uYWwgZGV2
aWNlIHdoZXJlIHRoZQpmb3JtZXIgb25lIGlzIGRyaXZpbmcgb25seSBwYXJ0IG9mIGl0LiBTdHJp
Y3RseSBzcGVha2luZyB0aGUga2VybmVsIGRyaXZlcgpzdWJtaXNzaW9uIGJlY29tZXMgYSB1c2Vy
IHNwYWNlIHJlZ3Jlc3Npb24uIFdoaWNoIGVmZmVjdGl2ZWx5IG1lYW5zIHRoYXQgd2hlbmV2ZXIK
eW91IG9wZW4gaTNjZGV2LCBubyBvdGhlciBrZXJuZWwgZHJpdmVycyBtYXkgYXBwZWFyLiBZZXMs
IEkgdW5kZXJzdGFuZCB0aGF0CmEgcG9vciB2aWN0aW0gb2Ygc3VjaCBhbiB1bmxpa2VseSBjb3Vy
c2Ugb2YgZXZlbnRzIG1heSByZWNvbXBpbGUgdGhlIGtlcm5lbCwKZGlzYWJsZSBkcml2ZXIsIGV0
IGNldGVyYSwgYnV0IHRoaXMgc3RpbGwgcmFpc2VzIHRoZSBzYW1lIHF1ZXN0aW9uLCB3aHkgZG8K
d2UgZG8gdGhhdCB0byB0aGUgbWVyZSB1c2Vycz8KCj4gPiBXaGF0IHRvIGRvIHdpdGggdGhlIGky
YyBkZXZpY2VzIGNvbm5lY3RlZCB0byBpM2MgYnVzIGluIHRoZSBjb21wYXRpYmxlIG1vZGU/Cj4g
Cj4gSTNDIG1hc3RlciBjb250cm9sbGVycyByZWdpc3RlciBhbiBpMmMgYWRhcHRlciBmb3IgaTJj
IGRldmljZXMgcnVubmluZyBvbiBhbgo+IGkzYyBtaXhlZCBtb2RlIGJ1cyAtIHRoZXkgYXJlIGlk
ZW50aWZpZWQgYXMgaTJjX2J1c190eXBlLCBub3QgaTNjLgoKUC5TPiBTdGlsbCBub3QgY29udmlu
Y2VkLCB0aGF0IHRoaXMgaGFzIHRvIGJlIGFuIEFCSS4gRm9yIGRlYnVnZnMgYW5kIHNvbWV0aGlu
ZwpsaWtlIHRoaXMsIG5vIG9iamVjdGlvbnMsIGJ1dCBBQkkuCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
