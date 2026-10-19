Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45243CCF2D6
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Oct 2026 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fxNbh35LCeWAuetJ6pbG84pniZTj1FFAhLRNSHEVdQ=; b=Ea75IeoWW289N1
	csKKH6UUlcSYXY6WsOOaXq6sMfSg22MDPqIRlkr1KB8tN75c2c+JbFvjmuQ+tCMOVtuBLa6YKHHLB
	318swkLwDPbNrqP/Z+MGB6qnK4r3/I12sGRhlI/iSNSwW21h3VyHqhRSaqNb8Jh6HN7w6Qn3NUU8o
	4g5YYXgSGEJFuMu2vC6KHoqDLBmZIplcaWMsnf+Fhk+b14wlr85d7dbs99kN7ATeIxqxTCJ70rasF
	tYqoUsvX7lJLJKhDIXFjnUcfkYFx6LJI7bpDNCMmBt7QUWIQeAHhCyJiH5E9Ks+vLnPg50oh2wRwQ
	yMmwF5jl0WjX8nU6RJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjyO-000000073bu-00v5;
	Mon, 19 Oct 2026 09:48:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjyL-000000073bL-02QM
	for linux-i3c@lists.infradead.org;
	Mon, 19 Oct 2026 09:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792403281; x=1823939281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/G1UAEnFK4MlLGs+aNQVo/T6zfPVnBWeth+ol/F/i08=;
  b=QZdUSOzR9Q8PLsc0Zlwg5r+T2wkQsVPbn0A9STQ82AcriqVRBMZyTFGq
   FvFLAIs96QId19fqE/fgBw5IU9G3DzRgDIHW7JsbHPl96Tt+rjXjQEN/+
   2UOicCLgbdV2+9ydG3NdUc79fMClcUCadr6sKVEIAvM+YbbdHgrpIfceH
   XnvMMvtyCm2YYAOZjM6ACixtqtvSIDkJR47fjivVMF7goMQTa2t2zi8HD
   r+AynuyKkidU5SP1BZ3J8xBQYFcT4a1bVePgABqCU7ozJ8qcSz7EDMOoe
   FFZUQm86Xh+xEsTjd/JS3563CwyBn9+F1a9c5qXLo5MnCElJ/ejpHP+tV
   w==;
X-CSE-ConnectionGUID: AU11xTpJRCeeDklVoqb9kA==
X-CSE-MsgGUID: xMo0+MDnQiCEPLfhZLLfBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="951482"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="951482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:48:00 -0700
X-CSE-ConnectionGUID: DcAcaTrVTIad6ooC1ISnuQ==
X-CSE-MsgGUID: l0WOJ4UzSTKfFTfq/WwKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2558322"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:47:57 -0700
Date: Mon, 19 Oct 2026 12:47:55 +0300
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
Message-ID: <atXnS1ZKGVfHDNEK@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local>
 <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atXmovzepBLP8Mqo@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_024801_101847_8BA54F2A 
X-CRM114-Status: GOOD (  39.09  )
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

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMTI6NDU6MTFQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFN1biwgT2N0IDE4LCAyMDI2IGF0IDAxOjI4OjQ0UE0gLTA3MDAsIFNhbSBB
Z2F6YXJ5YW4gd3JvdGU6Cj4gPiA+IFllcyBhbmQgbW9yZSBhcyB0aGlzIGJ1cyAoaTNjKSBpcyBz
dGlsbCBub24tZGlzY292ZXJhYmxlIChhbSBJIG1pc3Rha2VuPykuCj4gPiAKPiA+IEkzQyBpcyBh
IGR5bmFtaWNhbGx5IGRpc2NvdmVyYWJsZSBidXMuIER1cmluZyBEQUEgZWFjaCBJM0MgdGFyZ2V0
IHJlcG9ydHMgYQo+ID4gUHJvdmlzaW9uZWQgSUQgKFBJRCksIEJ1cyBDaGFyYWN0ZXJpc3RpYyBS
ZWdpc3RlciAoQkNSKSwgYW5kIERldmljZQo+ID4gQ2hhcmFjdGVyaXN0aWMgUmVnaXN0ZXIgKERD
UiksIGFuZCBpcyBhc3NpZ25lZCBhIGR5bmFtaWMgYWRkcmVzcyBieSB0aGUKPiA+IGNvbnRyb2xs
ZXIuCj4gCj4gRGlkIEkgbWlzcyB0aGlzIGluIHRoZSBpbml0aWFsIGV4cGxhbmF0aW9uPyBJZiBu
b3QsIHBsZWFzZSBhZGQgaXQgbmV4dCB0aW1lLgo+IAo+ID4gPiBUaGlzIG1ha2VzIGV2ZW4gbGVz
cyB1c2VmdWxuZXNzIGluIG15IGV5ZXMuIEltbWVkaWF0ZSBROiBpZiA0IGFscmVhZHkgaGF2ZSB0
aGUKPiA+ID4gcHJvcGVyIGRyaXZlciBpbiB0aGUga2VybmVsLCB3aGF0J3Mgd3JvbmcgdG8gbWFr
ZSBpdCBmb3IgdGhlIGZpZnRoIG9uZT8KPiA+IAo+ID4gMS4gVGhlIG9yaWdpbmFsIHVzZSBjYXNl
IHdhcyBoYXJkd2FyZSBicmluZy11cCwgc2lsaWNvbiB2YWxpZGF0aW9uLCBhbmQgZGVidWcKPiA+
IChpM2N0cmFuc2Zlcik6IEp1c3QgbGlrZSBzcGlkZXYsIGVuZ2luZWVycyBuZWVkIGEgZGVidWcg
aW50ZXJmYWNlCj4gPiB0byBpc3N1ZSBhZC1ob2MgU0RSL0hEUiB0cmFuc2ZlcnMgZHVyaW5nIGJy
aW5nLXVwIG9yIGhhcmR3YXJlIHZhbGlkYXRpb24gYmVmb3JlCj4gPiBhIGRyaXZlciBleGlzdHMu
Cj4gCj4gVG90YWxseSBkZWJ1ZyBmZWF0dXJlIHRvIG1lLiBPbmNlIHlvdSBleHBvc2Ugc29tZXRo
aW5nIGluIC9kZXYgKGltcGx5IElPQ1RMKSwKPiBpdCB3aWxsIGJlY29tZSBhbiBBQkkuIEFuZCBJ
J20gZnVsbHkgYWdhaW5zdCB0aGlzLgo+IAo+ID4gMi4gVXNlcnNwYWNlIGZpcm13YXJlIHJlY292
ZXJ5IC8gdXBkYXRlIHRvb2xzIChPQ1AgU2VjdXJlIEZpcm13YXJlCj4gPiBSZWNvdmVyeSwgQ2Fs
aXB0cmEgUm9UKToKPiA+IFRoZSByZWNvdmVyeSBwcm90b2NvbCBpcyBwdXJlbHkgYSBwb2xsZWQg
cmVxdWVzdC9yZXNwb25zZSB0cmFuc3BvcnQKPiA+IChubyBJQklzIGFsbG93ZWQgcGVyIHNwZWMp
IHVzZWQgYnkgdXNlcnNwYWNlIHVwZGF0ZSB0b29saW5nIChmd3VwZCAvIEJNQwo+ID4gcmVjb3Zl
cnkgZGFlbW9ucykgdG8gcGFyc2Ugc2lnbmVkIGZpcm13YXJlIG1hbmlmZXN0cywgc3RyZWFtIHJl
Y292ZXJ5IGltYWdlCj4gPiBjaHVua3MgdG8gSU5ESVJFQ1RfRklGT19EQVRBLCBhbmQgcG9sbCBS
RUNPVkVSWV9TVEFUVVPigJRzaW1pbGFyIHRvIGhvdwo+ID4gdXNlcnNwYWNlIGZpcm13YXJlIHVw
ZGF0ZXJzIG9wZXJhdGUgb3ZlciBzcGlkZXYsIGhpZHJhdywgb3IgVVNCL05WTWUgaW9jdGxzCj4g
PiByYXRoZXIgdGhhbiBwdXR0aW5nIGZpcm13YXJlIGltYWdlIHBhcnNpbmcgYW5kIHVwZGF0ZSBw
b2xpY3kgaW5zaWRlIHRoZQo+ID4ga2VybmVsLiBJbiBteSByZXNwb25zZSB0byBXb2xmcmFtIGFi
b3ZlIEkgZGlzY3Vzc2VkIHRoaXMgc29tZSBtb3JlLgo+IAo+IERvIHdlIGhhdmUgc3VjaCB1c2Ug
Y2FzZXMgSVJMPyBEbyB3ZSBoYXZlIHRvb2xpbmcgc3VwcG9ydCAoYXQgbGVhc3QgcGVuZGluZykK
PiBzb21ld2hlcmU/IFdoeSBkb2VzIGl0IHJlcXVpcmUgdXNlciBzcGFjZSBpbnRlcmFjdGlvbiBp
biBfdGhpc18gd2F5IChtZWFuaW5nCj4gSU9DVEwgYW5kIC9kZXYgbm9kZSk/Cj4gCj4gPiA+IFdo
YXQgaWYgdGhlIGRldmljZSBuZWVkcyBtb3JlPyBPciBpZiB0aGlzIGlzIGEgbXVsdGktZnVuY3Rp
b25hbCBkZXZpY2UgdGhhdAo+ID4gPiBtYXkgaGF2ZSBkcml2ZXIgZm9yIG9ubHkgb25lIHBhcnQ/
Cj4gPiAKPiA+IElmIGEgZGV2aWNlIG5lZWRzIG1vcmUgdGhhbiBiYXNpYyB0cmFuc2ZlcnMgKHN1
Y2ggYXMgSUJJcywKPiA+IGhvdC1qb2luIGhhbmRsaW5nLCBvciBpbnRlZ3JhdGlvbiB3aXRoIGEg
c3Vic3lzdGVtIGxpa2UgaHdtb24vaWlvL21jdHApLAo+ID4gaXQgc2hvdWxkIHVzZSBhIGRlZGlj
YXRlZCBrZXJuZWwgZHJpdmVyLgo+ID4gCj4gPiBGb3IgbXVsdGktZnVuY3Rpb24gZGV2aWNlcywg
aWYgdGhlIGZ1bmN0aW9ucyBhcmUgZXhwb3NlZCBhcyBNSVBJIEkzQwo+ID4gVGFyZ2V0cyAoZS5n
LiBhIGRldmljZSBleHBvc2luZyBib3RoIGFuIG1jdHAtaTNjIGludGVyZmFjZSBhbmQKPiA+IGFu
IE9DUCByZWNvdmVyeSBpbnRlcmZhY2UpLCBlYWNoIHZpcnR1YWwgdGFyZ2V0IGlzIGFzc2lnbmVk
IGl0cyBvd24KPiA+IGR5bmFtaWMgYWRkcmVzcyBhbmQgRENSIGR1cmluZyBFTlREQUEgYW5kIGlz
IGVudW1lcmF0ZWQgYXMgYSBkaXN0aW5jdAo+ID4gaTNjX2RldmljZSBpbnN0YW5jZSBvbiB0aGUg
YnVzLiBDb252ZXJzZWx5LCBpZiBtdWx0aXBsZSBmdW5jdGlvbnMgc2hhcmUKPiA+IGEgc2luZ2xl
IEkzQyB0YXJnZXQgYWRkcmVzcyBhbmQgcmVnaXN0ZXIgbWFwLCBpM2NkZXYgaW50ZW50aW9uYWxs
eSBkb2VzCj4gPiBub3QgYWxsb3cgdXNlcnNwYWNlIHRvIGFjY2VzcyBhIHRhcmdldCB3aGlsZSBh
IGtlcm5lbCBkcml2ZXIgaXMgYm91bmQKPiA+IHRvIGl0IChhdm9pZGluZyB0aGUgSTJDX1NMQVZF
X0ZPUkNFIHByb2JsZW0gd2hlcmUgdXNlcnNwYWNlIGNhbiByYWNlCj4gPiB3aXRoIGEgYm91bmQg
ZHJpdmVyKSwgc28gdGhhdCBjYXNlIHNob3VsZCBiZSBoYW5kbGVkIGJ5IGFuIGluLWtlcm5lbAo+
ID4gTUZEIGRyaXZlciAtIGJ1dCB0aGF0IGlzIG5vdCB0aGUgdXNlIGNhc2UgYmVpbmcgdGFyZ2V0
ZWQgaGVyZSB3aXRoIE9DUAo+ID4gcmVjb3ZlcnkuCj4gCj4gU28sIGltYWdpbmUgdGhhdCBzb21l
b25lIHN1Ym1pdHMgYSBrZXJuZWwgZHJpdmVyIGZvciBhIHNpbXBsZSBkZXZpY2UsIHdoaWxlCj4g
YW5vdGhlciBwZXJzb24gYWxyZWFkeSB1c2VzIHRoZSBkcml2ZXIgZm9yIG11bHRpLWZ1bmN0aW9u
YWwgZGV2aWNlIHdoZXJlIHRoZQo+IGZvcm1lciBvbmUgaXMgZHJpdmluZyBvbmx5IHBhcnQgb2Yg
aXQuIFN0cmljdGx5IHNwZWFraW5nIHRoZSBrZXJuZWwgZHJpdmVyCj4gc3VibWlzc2lvbiBiZWNv
bWVzIGEgdXNlciBzcGFjZSByZWdyZXNzaW9uLiBXaGljaCBlZmZlY3RpdmVseSBtZWFucyB0aGF0
IHdoZW5ldmVyCj4geW91IG9wZW4gaTNjZGV2LCBubyBvdGhlciBrZXJuZWwgZHJpdmVycyBtYXkg
YXBwZWFyLiBZZXMsIEkgdW5kZXJzdGFuZCB0aGF0Cj4gYSBwb29yIHZpY3RpbSBvZiBzdWNoIGFu
IHVubGlrZWx5IGNvdXJzZSBvZiBldmVudHMgbWF5IHJlY29tcGlsZSB0aGUga2VybmVsLAo+IGRp
c2FibGUgZHJpdmVyLCBldCBjZXRlcmEsIGJ1dCB0aGlzIHN0aWxsIHJhaXNlcyB0aGUgc2FtZSBx
dWVzdGlvbiwgd2h5IGRvCj4gd2UgZG8gdGhhdCB0byB0aGUgbWVyZSB1c2Vycz8KPiAKPiA+ID4g
V2hhdCB0byBkbyB3aXRoIHRoZSBpMmMgZGV2aWNlcyBjb25uZWN0ZWQgdG8gaTNjIGJ1cyBpbiB0
aGUgY29tcGF0aWJsZSBtb2RlPwo+ID4gCj4gPiBJM0MgbWFzdGVyIGNvbnRyb2xsZXJzIHJlZ2lz
dGVyIGFuIGkyYyBhZGFwdGVyIGZvciBpMmMgZGV2aWNlcyBydW5uaW5nIG9uIGFuCj4gPiBpM2Mg
bWl4ZWQgbW9kZSBidXMgLSB0aGV5IGFyZSBpZGVudGlmaWVkIGFzIGkyY19idXNfdHlwZSwgbm90
IGkzYy4KCkZvcmdvdCB0byBhc2ssIGJ1dCBkbyB0aGV5IGludGVyZmVyZT8KCj4gUC5TPiBTdGls
bCBub3QgY29udmluY2VkLCB0aGF0IHRoaXMgaGFzIHRvIGJlIGFuIEFCSS4gRm9yIGRlYnVnZnMg
YW5kIHNvbWV0aGluZwo+IGxpa2UgdGhpcywgbm8gb2JqZWN0aW9ucywgYnV0IEFCSS4KCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
