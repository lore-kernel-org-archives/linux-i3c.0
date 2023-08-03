Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BC7C001DF
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Aug 2023 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpYgwF2GDIJ355Az3eo6wdJAHCDLJzHHYlqoc5XaD6Y=; b=wAjw1rKlk8IbYK
	dTUJViZ8hqtJSzvnDFqZSC61He4kEl4xrlMkB/L11kcNxBDNg3guI9+09GG8t/m0wtSdPHcx43GFl
	HykO890hMQwdUjDnIrFm5kHvGLZCrEJ8M8Wzhz+8qhYNHmtxxyBOKXNewAt9R0VRo/6/RUN77Ucia
	AD07Ljp8A6XqXDCbyFm1BknxjtznGeFnNKUZFsfsRird4WtpTl5j7zx3pa/77VNabo2H8mlkWuicP
	dcfHtNh4PdwlD+dk8b/4tuX6hadTQJ1QXklq+Xs+AIhaC1JJ0MyMctzgNd6PjG0/4xQq8OsioL0f4
	u7oaMGztW+XZNoUzUNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUFo-0076q6-29;
	Thu, 03 Aug 2023 09:04:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUFi-0076ny-2j
	for linux-i3c@lists.infradead.org;
	Thu, 03 Aug 2023 09:04:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ED57C0015;
	Thu,  3 Aug 2023 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691053450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=doEg/PPvVP0MYheppL2UKW8V2Z1q775yG4RJYswwK40=;
	b=RsGUpyVgS4FPvbXtrEPwOuTeWhgTlpsIltPnCWFYBHvg1yIwW9MXwZJaHJDWnqeZnHmstQ
	qnNAl4Aaf+mSXkkGyU597ThPN7Sjl4rds//6sf1CmGrIh+uN981bgE5QeNQO1DNLplIJy0
	wfCc9hrTzsSr6ucSuU/2lhmzgI3ThrloypK62HbIcVKnkWV9W8t+F9aUS2mtYq5twRV8dU
	SRPgrL2o/xhqnk4AHVzIaAZrcS2kuD9gYomYCMAEkPyJVmNk0QvfINDv4bvI4Z5EQdom2+
	rS0DtJK416nEt5RzUR/pijkoFGD8+alocKUQ+vO2LXR7QWgX4Wjx3XybF8ENGQ==
Date: Thu, 3 Aug 2023 11:04:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <linux-i3c@lists.infradead.org>, Conor Culhane
 <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH -next] i3c: master: svc: Do not check for 0 return after
 calling platform_get_irq()
Message-ID: <20230803110408.48bbe8ec@xps-13>
In-Reply-To: <20230803085149.149248-1-ruanjinjie@huawei.com>
References: <20230803085149.149248-1-ruanjinjie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_020415_046368_A1841349 
X-CRM114-Status: GOOD (  13.74  )
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

SGkgUnVhbiwKCnJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBUaHUsIDMgQXVnIDIwMjMg
MTY6NTE6NDkgKzA4MDA6Cgo+IEl0IGlzIG5vdCBwb3NzaWJsZSBmb3IgcGxhdGZvcm1fZ2V0X2ly
cSgpIHRvIHJldHVybiAwLiBVc2UgdGhlCj4gcmV0dXJuIHZhbHVlIGZyb20gcGxhdGZvcm1fZ2V0
X2lycSgpLgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJ1YW4gSmluamllIDxydWFuamluamllQGh1YXdl
aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgNCAr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCAwZDYzYjczMmVmMGMuLjc3
MGI0MGUyODAxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gQEAgLTE1
MTgsOCArMTUxOCw4IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRSX0VSUihtYXN0ZXItPnNjbGspOwo+
ICAKPiAgCW1hc3Rlci0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAtCWlmICht
YXN0ZXItPmlycSA8PSAwKQo+IC0JCXJldHVybiAtRU5PRU5UOwo+ICsJaWYgKG1hc3Rlci0+aXJx
IDwgMCkKPiArCQlyZXR1cm4gbWFzdGVyLT5pcnE7Cj4gIAo+ICAJbWFzdGVyLT5kZXYgPSBkZXY7
Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
