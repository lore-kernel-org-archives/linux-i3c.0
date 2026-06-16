Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEACD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOxUHk9t4h+XQ+WMHBmscoH+9NOB+tZTYZwYBbPIV/Q=; b=bVg8iK4cubAvr4
	vUSjkZ1IoI47DlxmQIUywepqS09yYJ7W33d+poPPVe0fvpeSz5p410NU/T8Ju9tboH+uApJf1nm1d
	0L8nFWEvpLShcWqKMKJuev3ZXKcolKJ9sTodgOzZmvti4Fy87PExFFmoI/D3ihIpAMUBGpxusLXOW
	zdext8nDaY90K0BM2YyOehPo+nmRXK40orMFRMl8f0IWE/YZU4qM+KeZU2oR8M0LEuRYMTQ4p+LSj
	Gk41ImG9AxNr+DRi5BF+aVF1IoFvadh04hYK5b2D7IbPLCazlurOswpA5F44wiC5/FiERV+SbA5X/
	BTBIDDQLOt50LqU0Ktbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSKZ-0000000FhNE-46os;
	Tue, 16 Jun 2026 11:51:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSKX-0000000FhMf-47Hv
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 11:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 502F54040E;
	Tue, 16 Jun 2026 11:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D16B1F000E9;
	Tue, 16 Jun 2026 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781610705;
	bh=WsNtcBsVegJaCA+VGQavK67IZLnaByRoa379LQQulSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0vmAo1W4qnSXv9cK+mkfUXkeY1o6jF38Lt4J7lPgjOwpR4Q8/vghXZ4kneLrgtpu
	 XdeION6ucocKDLUysS8zceoBIRBoxX5urFlwyX1OHVUee6vqOLBsdSjS/X/uClw/so
	 tHb5mRT24A9dkcKx7SNTjzpL7WsrQ26N5CITEBS/MQ/goRM1gsu4Y1GIpTDyzgoUxv
	 bCYW55aYCScMbp5S1ItmxlR4VIAQQKHrxPIB3ZON4D92yQ5jucO9haGXMSkaJzZ0Yh
	 9HMjPW8NsGpgi3VN97hx6cpHf97O91PzHQtqWTfw2d2ozU+ff69k9ZS0gE7C99vWKw
	 8/eGfSK9+4WxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] i3c: master: Add missing runtime PM get in
 dev_nack_retry_count_store()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260616113752.196140-3-adrian.hunter@intel.com>
References: <20260616113752.196140-3-adrian.hunter@intel.com>
Date: Tue, 16 Jun 2026 11:51:44 +0000
Message-Id: <20260616115145.0D16B1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBIYXJkd2FyZSBjb25maWd1cmF0aW9uLCBpbmNsdWRpbmcgdGhlIE5BQ0sgcmV0cnkg
Y291bnQsIGlzIGxvc3QgYWNyb3NzIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgY3ljbGVzLgotLQoK
Y29tbWl0IGM0MWViOWNlYWQyNDUwNzA5OGQ3YTU3ZGIwMTAxZGEwZTVjNjhjMzQKQXV0aG9yOiBB
ZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBBZGQg
bWlzc2luZyBydW50aW1lIFBNIGdldCBpbiBkZXZfbmFja19yZXRyeV9jb3VudF9zdG9yZSgpCgpF
bnN1cmUgdGhlIGRldmljZSBpcyBydW50aW1lIHJlc3VtZWQgd2hpbGUgdXBkYXRpbmcgdGhlIHJl
dHJ5CmNvbmZpZ3VyYXRpb24gdG8gYXZvaWQgYWNjZXNzaW5nIHRoZSBjb250cm9sbGVyIHdoaWxl
IHN1c3BlbmRlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLmMKPiBpbmRleCAwNWVhOWUzYzRkNDZmLi5hMjQ5NDQwNDdlMzBjIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKClsgLi4uIF0KCj4gQEAgLTc2NywxMiArNzY3LDE4IEBAIHN0YXRpYyBzc2l6ZV90IGRldl9u
YWNrX3JldHJ5X2NvdW50X3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCWkzY19idXNfbWFp
bnRlbmFuY2VfbG9jayhpM2NidXMpOwo+ICAJcmV0ID0gbWFzdGVyLT5vcHMtPnNldF9kZXZfbmFj
a19yZXRyeShtYXN0ZXIsIHZhbCk7Cj4gIAlpZiAoIXJldCkKPiAgCQltYXN0ZXItPmRldl9uYWNr
X3JldHJ5X2NvdW50ID0gdmFsOwo+ICAJaTNjX2J1c19tYWludGVuYW5jZV91bmxvY2soaTNjYnVz
KTsKPiAgCj4gKwlpM2NfbWFzdGVyX3JwbV9wdXQobWFzdGVyKTsKCltTZXZlcml0eTogSGlnaF0K
VGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHB1dHRp
bmcgdGhlIGRldmljZSB0bwpzbGVlcCBoZXJlIGltbWVkaWF0ZWx5IGNhdXNlIHRoZSBuZXdseSB3
cml0dGVuIHJldHJ5IGNvdW50IHRvIGJlIGxvc3Q/CgpXaGVuIHRoZSBkdy1pM2MtbWFzdGVyIGRl
dmljZSBlbnRlcnMgcnVudGltZSBzdXNwZW5kLCB0aGUgaGFyZHdhcmUgaXMgcmVzZXQKdmlhIHJl
c2V0X2NvbnRyb2xfYXNzZXJ0KCkgaW4gZHdfaTNjX21hc3Rlcl9ydW50aW1lX3N1c3BlbmQoKS4K
ClVwb24gcmVzdW1pbmcsIGR3X2kzY19tYXN0ZXJfcmVzdG9yZV9hZGRycygpIHJlYWRzIHRoZSBu
ZXdseSByZXNldCBoYXJkd2FyZQpyZWdpc3RlciAod2hpY2ggcmV0dXJucyAwKSwgdXBkYXRlcyBv
bmx5IHRoZSBhZGRyZXNzIGJpdHMsIGFuZCB3cml0ZXMgaXQKYmFjay4gVGhpcyBwZXJtYW5lbnRs
eSBkaXNjYXJkcyBvdGhlciBjb25maWd1cmF0aW9uIGZpZWxkcywgaW5jbHVkaW5nIHRoZQpERVZf
QUREUl9UQUJMRV9ERVZfTkFDS19SRVRSWV9DTlQgY29uZmlndXJlZCBoZXJlLCBhcyB3ZWxsIGFz
IG90aGVyIGZpZWxkcwpsaWtlIFNJUl9SRUpFQ1QgYW5kIElCSV9NREIuCgpCZWNhdXNlIGRldl9u
YWNrX3JldHJ5X2NvdW50X3N0b3JlKCkgbm93IGNvcnJlY3RseSBkcm9wcyB0aGUgcnVudGltZSBQ
TQpyZWZlcmVuY2UsIHRoZSBjb250cm9sbGVyIGNhbiBzdXNwZW5kIGltbWVkaWF0ZWx5IGFmdGVy
IHRoZSBjb25maWd1cmF0aW9uIGlzCndyaXR0ZW4uIFdpbGwgdGhpcyBzaWxlbnRseSByZXZlcnQg
dGhlIHJldHJ5IGNvdW50IGJhY2sgdG8gaXRzIHJlc2V0IHN0YXRlPwoKPiArCj4gIAlyZXR1cm4g
cmV0ID86IGNvdW50Owo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjE2MTEzNzUyLjE5NjE0MC0xLWFkcmlhbi5odW50ZXJA
aW50ZWwuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
