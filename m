Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8BAC9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMs/sEXq4EjL2upf1UtNj5sFxMLzOl9BjtTac799CeM=; b=U7NCQo3IaD+NHZ
	lEwXCqF4/CFKXYsJo4ecG+yKQwiU2poFSGkG5B+L4En2WKddzm4b7ad89Falz4TKeleLAkbXXOUuu
	fO9dsUgWj8Xg4QRVpN38VSZPdOWMZ1/MZTaNTaea8dTIJhgs/b6pDOJSbdDjVl9DAKstkg62IBN2+
	RcCylma5NdLvPQ934GssTjG2eiPyjO1ZUSEDo9Xv1+IN4/6axaLc4PcFevmkNf5Ta317L1lxAGKF8
	/UrFMwFdP2/Mykw/t52kgXq73vC0peuCU73RymYBgTo7Ws8k95lK6fPAtzjaA6FjgHzvWVhsf37Lw
	5WBAcuo5hAb27H+biM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRb8-00000002WNl-39BE;
	Tue, 29 Sep 2026 06:45:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRb7-00000002WNO-0zl9
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A1F143B7F;
	Tue, 29 Sep 2026 06:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7591F000FF;
	Tue, 29 Sep 2026 06:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664352;
	bh=AspREdINjSLLrvQ737uEtpGtsblqZXMWOV/IzKwbKcQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rc/lqLHaJzggzwoqMLN4SuQyDuGYHwpSXoSy+VHIfSR5KssvSopv4ZdaXWOB3INg4
	 CpM/LGULJ185lHTjLwdD9QB1UlWszV6m7K6FfQC14todEFFmaKAwUVLz/6IjvHu6Db
	 o3aE2ulnEoe6sirssoKHwaBIsHcl7ZTdfeosDcrw76rvDtKuYqB05Rxmtnw/Bv7AJg
	 t6oQvOttPxVV/poIsnGxhCPUJxGvfTvnR6Fw9mmJ19z5xxJngmmC5kwzDLyejUMA3Y
	 rH6n2UtU3evZh68qWGNd6pnP5EjCuewlpQjhkwLREZsg73L9cU15f1XNO+bsLXmyVK
	 QWWZrB8lPbVgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/20] pinctrl: berlin: enable module build support
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org
In-Reply-To: <20260929061417.20733-12-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-12-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:45:51 +0000
Message-Id: <20260929064552.1D7591F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBpbmN0cmw6IGJlcmxp
bjogbWlzc2luZyBLY29uZmlnL01ha2VmaWxlIGNoYW5nZXMgZm9yIG1vZHVsZSBidWlsZAotLQoK
Y29tbWl0IDkwMDE3YzUzZWNiOWUzZjdjOTIxZjI5OWVlMjAwODU0NzEyODNmNzgKQXV0aG9yOiBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+CgpwaW5jdHJsOiBiZXJsaW46IGVuYWJs
ZSBtb2R1bGUgYnVpbGQgc3VwcG9ydAogICAgClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIGJlcmxp
biBwaW5jdHJsIGxpYnJhcnkgdG8gdXNlIGRldnJlcyBhbGxvY2F0aW9uIEFQSXMsCmV4cG9ydHMg
bmVjZXNzYXJ5IHN5bWJvbHMsIGFuZCBhZGRzIG1vZHVsZSBtZXRhZGF0YS4gVGhpcyBpcyBpbnRl
bmRlZCB0byBhbGxvdwpidWlsZGluZyB0aGUgZHJpdmVycyBhcyBsb2FkYWJsZSBtb2R1bGVzIGZv
ciB2ZW5kb3JfZGxrbSBkZXBsb3ltZW50cy4KCj4gRm9yIEFuZHJvaWQgR0tJICsgdmVuZG9yX2Rs
a20gZGVwbG95bWVudHMsIHdoZXJlIHZlbmRvci1zcGVjaWZpYwo+IGRyaXZlcnMgbXVzdCBiZSBr
ZXB0IHNlcGFyYXRlIGZyb20gdGhlIEdLSSB2bWxpbnV4IGFuZCBsb2FkZWQgYXMKPiBtb2R1bGVz
IGZyb20gdGhlIHZlbmRvciBwYXJ0aXRpb24sIHdlIG5lZWQgdG8gZW5hYmxlIG1vZHVsZSBidWls
ZAo+IHN1cHBvcnQgZm9yIGJlcmxpbiBwaW5jdHJsIGRyaXZlcnMuCgpbU2V2ZXJpdHk6IEhpZ2hd
CkFyZSBLY29uZmlnIGFuZCBNYWtlZmlsZSB1cGRhdGVzIGFsc28gbmVlZGVkIHRvIGZ1bGx5IGVu
YWJsZSBtb2R1bGUgc3VwcG9ydD8KClRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhlIGdvYWwg
aXMgdG8gZW5hYmxlIG1vZHVsZSBidWlsZHMsIGJ1dCBLY29uZmlnCmFuZCBNYWtlZmlsZSBjaGFu
Z2VzIGFwcGVhciB0byBiZSBtaXNzaW5nIGZyb20gdGhlIHBhdGNoLiAKCkluIGRyaXZlcnMvcGlu
Y3RybC9iZXJsaW4vS2NvbmZpZywgUElOQ1RSTF9CRVJMSU4gaXMgY3VycmVudGx5IHJlc3RyaWN0
ZWQKdG8gYm9vbDoKCmNvbmZpZyBQSU5DVFJMX0JFUkxJTgoJYm9vbAoKSW4gZHJpdmVycy9waW5j
dHJsL2Jlcmxpbi9NYWtlZmlsZSwgYmVybGluLm8gaXMgdW5jb25kaXRpb25hbGx5IGJ1aWx0LWlu
OgoKb2JqLXkgKz0gYmVybGluLm8KCldpdGhvdXQgY2hhbmdpbmcgdGhlc2UgdG8gdXNlIGEgdHJp
c3RhdGUgYW5kIG9iai0kKENPTkZJR19QSU5DVFJMX0JFUkxJTiksCnRoZSBvYmplY3QgaXMgY29t
cGlsZWQgaW50byBhIGJ1aWx0LWluIGFyY2hpdmUgZHVyaW5nIGEgbW9kdWxlIGJ1aWxkLiBJdCBp
cwpuZXZlciBsaW5rZWQgaW50byB0aGUgbG9hZGFibGUgbW9kdWxlLCB3aGljaCBjYXVzZXMgdW5k
ZWZpbmVkIHJlZmVyZW5jZXMgdG8KYmVybGluX3BpbmN0cmxfcHJvYmUgZHVyaW5nIGRyaXZlciBs
b2FkaW5nLgoKQWRkaXRpb25hbGx5LCBkb2VzIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKCkgaW4g
dGhlIFNvQyBkcml2ZXJzIHByZXZlbnQgdGhlbQpmcm9tIGJlaW5nIGJ1aWx0IGFzIG1vZHVsZXM/
CgpGb3IgZXhhbXBsZSwgaW4gZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9iZXJsaW4tYmcyLmM6Cgpi
dWlsdGluX3BsYXRmb3JtX2RyaXZlcihiZXJsaW4yX3BpbmN0cmxfZHJpdmVyKTsKCldvdWxkIHRo
aXMgbmVlZCB0byBiZSB1cGRhdGVkIHRvIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSB0byBhbGxv
dyBleGlzdGluZwpTb0MgZHJpdmVycyB0byBiZSBidWlsdCBhcyBsb2FkYWJsZSBtb2R1bGVzIGFs
b25nc2lkZSB0aGUgY29yZSBsaWJyYXJ5PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyOTA2MTQxNy4yMDczMy0xLWpzemhhbmdA
a2VybmVsLm9yZz9wYXJ0PTExCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
