Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1559BC3F68F
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:52:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87A62077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqRbLHN7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87A62077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HKoAUPPHIPf8dmbpQJvRB7zJIiOtVoD/kuZYB3rJ58=; b=KqRbLHN79N1SQn
	VEdiKImmMIEbOEBUKHok0quBzPMhTzxgr9PPqGzya9qRcZNJfDVBUOIxeEWN3gLknxZD32h1eDm+R
	RM/QpnKH6OF0dujZQ+Hw8/ixUglIsgcFuGqt3fVQ9SH+xamZpIo0MWb7hS3AJy5Wwuevc+5hOseJ8
	zOIYPUgvK4eNOhiD9IBiHa9Y4YsHcOBJVoIJ5PBMNhZ8lv0xSl7p40yM9qNQwsm2qmqQNjIg/nzFe
	s2Qb4aX63miHZolSnvBHCPzu6f61CEzsiggGfpxz0RxEKqCmjLWIo0stpu0fyltBnXM//NUjlALYU
	OK9nLjXS8wLdIBu6sY7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegse-0005hM-05; Tue, 10 Dec 2019 14:52:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegsb-0005cg-9i
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 14:52:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E75F260785;
 Tue, 10 Dec 2019 14:52:47 +0000 (GMT)
Date: Tue, 10 Dec 2019 15:52:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 6/6] i3c: master: dw: reattach device on first
 available location of address table
Message-ID: <20191210155244.4ebb7bbf@collabora.com>
In-Reply-To: <CH2PR12MB42165699E80C5063BE111BB7AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
 <20191210101502.8401-7-pgaj@cadence.com>
 <CH2PR12MB42165699E80C5063BE111BB7AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_065249_478568_ED4D6729 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: =?UTF-8?B?UHJ6ZW15c8WCYXc=?= Gaj <pgaj@cadence.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMCBEZWMgMjAxOSAxNDo0MDo0OSArMDAwMApWaXRvciBTb2FyZXMgPFZpdG9yLlNv
YXJlc0BzeW5vcHN5cy5jb20+IHdyb3RlOgoKPiArK0pvw6NvIFBpbnRvCj4gCj4gSGkgUHJ6ZW15
c8WCYXcsCj4gCj4gU29ycnkgZm9yIHRoaXMsIGJ1dCBwbGVhc2UgZHJvcCB0aGlzIHBhdGNoIGZy
b20gdGhpcyBzZXJpZXMuIEJvcmlzIGFzIAo+IE1haW50YWluZXIgY291bGQgYWxyZWFkeSBtZXJn
ZSBpdCB3aGVuIGdpdmVzIHJiIHRhZy4KCk5vdGVkLCBJJ2xsIHF1ZXVlIHRoYXQgb25lIHNlcGFy
YXRlbHkgKElJVUMsIGl0J3MgaW5kZXBlbmRlbnQgZnJvbSB0aGUKcmVzdCBvZiB0aGUgc2VyaWVz
KS4KCj4gCj4gRnJvbTogUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+IERhdGU6
IFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDEwOjE1OjAyCj4gCj4gPiBGcm9tOiBWaXRvciBTb2FyZXMg
PHZpdG9yLnNvYXJlc0BzeW5vcHN5cy5jb20+Cj4gPiAKPiA+IEZvciB0b2RheSB0aGUgcmVhdHRh
Y2ggZnVuY3Rpb24gb25seSB1cGRhdGUgdGhlIGRldmljZSBhZGRyZXNzIG9uIHRoZQo+ID4gY29u
dHJvbGxlci4KPiA+IAo+ID4gVXBkYXRlIHRoZSBsb2NhdGlvbiB0byB0aGUgZmlyc3QgYXZhaWxh
YmxlIHRvbywgd2lsbCBvcHRpbWl6ZSB0aGUKPiA+IGVudW1lcmF0aW9uIHByb2Nlc3MgYXZvaWRp
bmcgYWRkaXRpb25hbCBjaGVja3MgdG8ga2VlcCB0aGUgYXZhaWxhYmxlCj4gPiBwb3NpdGlvbnMg
b24gYWRkcmVzcyB0YWJsZSBjb25zZWN1dGl2ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVml0
b3IgU29hcmVzIDx2aXRvci5zb2FyZXNAc3lub3BzeXMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBQcnplbXlzbGF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiA+IC0tLQo+ID4gQ2hh
bmdlIGluIHYzOgo+ID4gICAtIE5vbmUKPiA+IAo+ID4gQ2hhbmdlIGluIHYyOgo+ID4gICAtIEFk
ZCBCb3JpcyByYi10YWcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2Mt
bWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCj4gPiBpbmRleCBi
MGZmMGUxMmQ4NGMuLmM2Y2FiYTM5YTM0YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaTNjL21h
c3Rlci9kdy1pM2MtbWFzdGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2Mt
bWFzdGVyLmMKPiA+IEBAIC04OTksNiArODk5LDIyIEBAIHN0YXRpYyBpbnQgZHdfaTNjX21hc3Rl
cl9yZWF0dGFjaF9pM2NfZGV2KHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiA+ICAJc3RydWN0
IGR3X2kzY19pMmNfZGV2X2RhdGEgKmRhdGEgPSBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YShkZXYp
Owo+ID4gIAlzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptID0gaTNjX2Rldl9nZXRfbWFz
dGVyKGRldik7Cj4gPiAgCXN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0ZXIgPSB0b19kd19pM2Nf
bWFzdGVyKG0pOwo+ID4gKwlpbnQgcG9zOwo+ID4gKwo+ID4gKwlwb3MgPSBkd19pM2NfbWFzdGVy
X2dldF9mcmVlX3BvcyhtYXN0ZXIpOwo+ID4gKwo+ID4gKwlpZiAoZGF0YS0+aW5kZXggPiBwb3Mg
JiYgcG9zID4gMCkgewo+ID4gKwkJd3JpdGVsKDAsCj4gPiArCQkgICAgICAgbWFzdGVyLT5yZWdz
ICsKPiA+ICsJCSAgICAgICBERVZfQUREUl9UQUJMRV9MT0MobWFzdGVyLT5kYXRzdGFydGFkZHIs
IGRhdGEtPmluZGV4KSk7Cj4gPiArCj4gPiArCQltYXN0ZXItPmFkZHJzW2RhdGEtPmluZGV4XSA9
IDA7Cj4gPiArCQltYXN0ZXItPmZyZWVfcG9zIHw9IEJJVChkYXRhLT5pbmRleCk7Cj4gPiArCj4g
PiArCQlkYXRhLT5pbmRleCA9IHBvczsKPiA+ICsJCW1hc3Rlci0+YWRkcnNbcG9zXSA9IGRldi0+
aW5mby5keW5fYWRkcjsKPiA+ICsJCW1hc3Rlci0+ZnJlZV9wb3MgJj0gfkJJVChwb3MpOwo+ID4g
Kwl9Cj4gPiAgCj4gPiAgCXdyaXRlbChERVZfQUREUl9UQUJMRV9EWU5BTUlDX0FERFIoZGV2LT5p
bmZvLmR5bl9hZGRyKSwKPiA+ICAJICAgICAgIG1hc3Rlci0+cmVncyArCj4gPiAtLSAKPiA+IDIu
MTQuMCAgCj4gCj4gQmVzdCByZWdhcmRzLAo+IFZpdG9yIFNvYXJlcwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
