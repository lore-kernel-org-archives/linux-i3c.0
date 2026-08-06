Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A926C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OysozF+Aw2/nc/5A4HOX0AXjI8N/EVNkUrZOrJG7lf4=; b=mFTgvfikWNEtwC
	lplxRcYPKH38ZXkD/h5LTJcnWjfWkqVmcZ9bk9ZeXr5wdfcKpWBUYq5HumdNL2KS/XuC1My18+iaE
	Oy6YbPZeN7QcyqJqPXmD+WIQtRMLfxWVNk28RKgvokf676Hxnk6HyT4JfjsxR9qJ3U1juh/K7PsKi
	uxz5j2Lam+h+xxL2a8h2IH9NImNGRs+vSlEd59uCEI5hQ/j+3VE9yCmaOPMI5hd+q/4DnPRzMMQnX
	pFiPi4zrFQxV2Rf/p5fZ06czNoFhFwpI54oU7eiRoyMVDldMWjitT9yUNlPsatWcnNOE3w4mii158
	yM1sEoI1aq4GJZmv9Vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryM9-00000005vgr-3wyE;
	Thu, 06 Aug 2026 13:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryM8-00000005vgl-2wkC
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BA4660A69;
	Thu,  6 Aug 2026 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA381F000E9;
	Thu,  6 Aug 2026 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023715;
	bh=Qhr++JzfsbPhsJGaP3LCSgpnbC7usMJ6KiEXWXen0us=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PO7xWQ6z4mfAv2CTr+s2otvmMBsYk1qkUT9ilrDktQYnWbG6Faes7SO8pjTVAgSxl
	 yF2q5m/bgdD9T75HQZR8sscTbhxWSrRkItu40y1SO8pFVO0YgiSdXZJlbGU1iAwLHZ
	 OWvDNE+Jyqr12XsWxsTGpvWCXLqSLyFWAUtW2gtgQj8JNK0rAdekOrEkUQcF369Rec
	 YH+kLLApJAEondYbKZebvFvPa+7u7yxdpEsD4Lu9zglkc82RmA/rINQwDLPWELSIUf
	 XQLsTk9+cAgb7JSakdnQvEoCx+A6mX8fhMjf1RSJp0v63oRQmqg/eq0DnIDXQ0eBaV
	 nFCiowid9HT8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 11/14] i3c: master: Reject IBI requests from
 non-IBI-capable devices
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260806131857.119830-12-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-12-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:41:54 +0000
Message-Id: <20260806134155.6AA381F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBXb3JrcXVldWUgYW5kIHJlc2N1ZSB0aHJlYWQgbGVhayBpbiBlcnJvciBwYXRoIG9m
IGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKCkuCi0tCgotLS0gUGF0Y2ggWzExXTogW1BBVENI
IFY0IDExLzE0XSBpM2M6IG1hc3RlcjogUmVqZWN0IElCSSByZXF1ZXN0cyBmcm9tIG5vbi1JQkkt
Y2FwYWJsZSBkZXZpY2VzIC0tLQpjb21taXQgY2M5YzY2NWM0MjFhMWQ5ODc5NDlhMDYyNjlhZjY5
NjhhZmQ1YTg5ZApBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29t
PgpTdWJqZWN0OiBpM2M6IG1hc3RlcjogUmVqZWN0IElCSSByZXF1ZXN0cyBmcm9tIG5vbi1JQkkt
Y2FwYWJsZSBkZXZpY2VzCgpUaGlzIGNvbW1pdCBhZGRzIGEgY2FwYWJpbGl0eSBjaGVjayBiZWZv
cmUgYWxsb3dpbmcgZGV2aWNlcyB0byBzZXQgdXAgSUJJCnJlcXVlc3RzLiBJdCBmYWlscyB3aXRo
IC1FT1BOT1RTVVBQIGlmIHRoZSBkZXZpY2UgZG9lcyBub3QgYWR2ZXJ0aXNlIElCSQpzdXBwb3J0
LCBlbnN1cmluZyBjb25zaXN0ZW5jeSB3aXRoIG90aGVyIElCSSBmZWF0dXJlcy4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL2RldmljZS5jIGIvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiBpbmRl
eCA1ZTZkZjZkZTAyODM0Li5mMWJhMzYzYjIyYTE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNj
L2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiBAQCAtMjA0LDEyICsyMDQs
MTQgQEAgaW50IGkzY19kZXZpY2VfcmVxdWVzdF9pYmkoc3RydWN0IGkzY19kZXZpY2UgKmRldiwK
PiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAgCWkzY19idXNfbm9ybWFsdXNlX2xvY2soZGV2LT5idXMp
Owo+IC0JaWYgKGRldi0+ZGVzYykgewo+ICsJaWYgKCFkZXYtPmRlc2MpIHsKPiArCQlyZXQgPSAt
RU5PRU5UOwo+ICsJfSBlbHNlIGlmICghKGRldi0+ZGVzYy0+aW5mby5iY3IgJiBJM0NfQkNSX0lC
SV9SRVFfQ0FQKSkgewo+ICsJCXJldCA9IC1FT1BOT1RTVVBQOwo+ICsJfSBlbHNlIHsKPiAgCQlt
dXRleF9sb2NrKCZkZXYtPmRlc2MtPmliaV9sb2NrKTsKPiAgCQlyZXQgPSBpM2NfZGV2X3JlcXVl
c3RfaWJpX2xvY2tlZChkZXYtPmRlc2MsIHJlcSk7CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNu
J3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcyB0aGUgZXJyb3IgcGF0
aCBpbgppM2NfZGV2X3JlcXVlc3RfaWJpX2xvY2tlZCgpIGxlYWsgdGhlIHdvcmtxdWV1ZT8KCldo
ZW4gbWFzdGVyLT5vcHMtPnJlcXVlc3RfaWJpKCkgZmFpbHMsIHRoZSBwcmV2aW91c2x5IGFsbG9j
YXRlZCB3b3JrcXVldWUKYXBwZWFycyB0byBiZSBvcnBoYW5lZDoKCmRyaXZlcnMvaTNjL21hc3Rl
ci5jOmkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKCkgewogICAgLi4uCglpYmktPndxID0gYWxs
b2Nfb3JkZXJlZF93b3JrcXVldWUoZGV2X25hbWUoLi4uKSwgV1FfTUVNX1JFQ0xBSU0pOwoJaWYg
KCFpYmktPndxKSB7CiAgICAgICAgLi4uCgl9CiAgICAuLi4KCXJldCA9IG1hc3Rlci0+b3BzLT5y
ZXF1ZXN0X2liaShkZXYsIHJlcSk7CglpZiAocmV0KSB7CgkJa2ZyZWUoaWJpKTsKCQlkZXYtPmli
aSA9IE5VTEw7Cgl9CiAgICAuLi4KfQoKQ2FuIHRoaXMgbGVhdmUgdGhlIHdxIGFuZCBpdHMgYXNz
b2NpYXRlZCByZXNjdWUgd29ya2VyIHRocmVhZCBwZXJtYW5lbnRseQpsZWFrZWQgc2luY2UgZGVz
dHJveV93b3JrcXVldWUoKSBpcyBuZXZlciBjYWxsZWQgYmVmb3JlIGtmcmVlKGliaSk/Cgo+ICAJ
CW11dGV4X3VubG9jaygmZGV2LT5kZXNjLT5pYmlfbG9jayk7Cj4gLQl9IGVsc2Ugewo+IC0JCXJl
dCA9IC1FTk9FTlQ7Cj4gIAl9Cj4gIAlpM2NfYnVzX25vcm1hbHVzZV91bmxvY2soZGV2LT5idXMp
OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDgwNjEzMTg1Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEx
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
