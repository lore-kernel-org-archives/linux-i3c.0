Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE41C7EE26
	for <linux-i3c@archiver.kernel.org>; Mon, 22 May 2023 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9plCmp/S9+YF3DrG+lrkOQPJ5YZPJ4FZEn7fKJzTL90=; b=t/gqBD88H0bq7b
	lNJjXLWGQm4EDahgoNxJ+DIKEyuYTEsbylJGDkl1jd0eZB+Z/ra2ysRDqfLgGF+MikFcJCxhG8/0s
	RYsH+53gkeBYkTTSpueiqa/HtkQ2/WCVXtou7gIAWee/43ZKgXe6GRDGLBJHlrdZfDBwYaD7TxMzY
	DorNmewzJD2Laxua+beFTNabDqZEpIpXoJnEMuRdEdP3QEY7EIHHakknBKc5zDLRMdfCNXbzn+by6
	B2Js7EYkL0FYF5so3bEDQtcY8KRwq4yjsRLVKf2rJ5JzEnL1d1dZK8mJpdpO4GorKhnFpkUGjUmFi
	XKpsp0OHzyzeqzTaeOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10z5-005lDo-36;
	Mon, 22 May 2023 08:33:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10yz-005lCh-0i
	for linux-i3c@lists.infradead.org;
	Mon, 22 May 2023 08:33:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7B0981C000A;
	Mon, 22 May 2023 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684744409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/bPlbQWSxPOpbiZwEhUe5DhihOAH0/pWLbUpPckCNI=;
	b=kgQBXulqrKzn6cyxRNQkH9bmcUcg17TDtzj+1UeH5L5mFqtH9cTZkVBa/2N+FlOhsTNTYV
	xRo68LWBJtdN3m7+M8mC/d7mvV0ZlaSIic+LWn4v8JCNoHH4WsVPr4cfT+RcBGy1Cf8Q2T
	tS5tg2NuYixUVuzz3LsTKaDr3M0o3SIq1x1sOktxz0GPs6nJuYzXvkLHbHvcPTNDUJJi4C
	0D5R5Hlwc9NXa55+cctlD8rx9tWQkO3aHpIdmZoltmfcbi3j1STWalB5Dm0JbU58B62gX0
	UM84TRGnk2/YXit6TXACtZV3rbYvQ21WPKmIIxBEbrq7mWJe0zNXRxjbf/L2HA==
Date: Mon, 22 May 2023 10:33:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: add NACK check after start byte sent
Message-ID: <20230522103327.16e95d02@xps-13>
In-Reply-To: <20230517033030.3068085-3-xiaoning.wang@nxp.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
	<20230517033030.3068085-3-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_013333_400161_9AD7D97A 
X-CRM114-Status: GOOD (  13.41  )
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

SGkgQ2xhcmssCgp4aWFvbmluZy53YW5nQG54cC5jb20gd3JvdGUgb24gV2VkLCAxNyBNYXkgMjAy
MyAxMTozMDozMCArMDgwMDoKCj4gQWRkIE5BQ0sgY2hlY2sgYWZ0ZXIgc3RhcnQgYnl0ZSBpcyBz
ZW50Lgo+IEl0IGlzIHBvc3NpYmxlIHRvIGRldGVjdCBlYXJseSB0aGF0IGEgZGV2aWNlIGlzIG5v
dCBvbiB0aGUgYnVzCj4gYW5kIGF2b2lkIGludmFsaWQgdHJhbnNtaXNzaW9ucyB0aGVyZWFmdGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4K
Ck5pY2UgYWRkaXRpb24uCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMv
aTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gaW5kZXggNGVkZjMzZWQyMDdkLi4wZDYzYjcz
MmVmMGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMK
PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IEBAIC05Miw2ICs5
Miw3IEBACj4gICNkZWZpbmUgU1ZDX0kzQ19NSU5UQ0xSICAgICAgMHgwOTQKPiAgI2RlZmluZSBT
VkNfSTNDX01JTlRNQVNLRUQgICAweDA5OAo+ICAjZGVmaW5lIFNWQ19JM0NfTUVSUldBUk4gICAg
IDB4MDlDCj4gKyNkZWZpbmUgICBTVkNfSTNDX01FUlJXQVJOX05BQ0sgQklUKDIpCj4gICNkZWZp
bmUgU1ZDX0kzQ19NRE1BQ1RSTCAgICAgMHgwQTAKPiAgI2RlZmluZSBTVkNfSTNDX01EQVRBQ1RS
TCAgICAweDBBQwo+ICAjZGVmaW5lICAgU1ZDX0kzQ19NREFUQUNUUkxfRkxVU0hUQiBCSVQoMCkK
PiBAQCAtMTAxNCw2ICsxMDE1LDExIEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihz
dHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCWlmIChyZXQpCj4gIAkJZ290byBlbWl0
X3N0b3A7Cj4gIAo+ICsJaWYgKHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTUVSUldBUk4p
ICYgU1ZDX0kzQ19NRVJSV0FSTl9OQUNLKSB7Cj4gKwkJcmV0ID0gLUVOWElPOwo+ICsJCWdvdG8g
ZW1pdF9zdG9wOwo+ICsJfQo+ICsKPiAgCWlmIChybncpCj4gIAkJcmV0ID0gc3ZjX2kzY19tYXN0
ZXJfcmVhZChtYXN0ZXIsIGluLCB4ZmVyX2xlbik7Cj4gIAllbHNlCgoKVGhhbmtzLApNaXF1w6hs
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
