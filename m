Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B210C5518F
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGVExpKZiwbrJ3l6JYG1h905MO+5Np+YM2dK99KaJdE=; b=X4mDF/7qgsOYL6
	Y9dRDx7RJ967+smjddaJ4BwKrSlc7TW6AXurv/JJA9hLbOAu8Om2BflDEuYSqM10kto2CnZFEcrkz
	vSNpJf0fMiDp4whZTXwmgJnn/9c55WGiPGzhm+rHVH8nBAKg8bH0796e9GzbU4k/nyh7W9g2hV0ay
	jnkgeqE7b8tzSEr4ZgtXqES80sYht7D5DLiyBgREJsQViNIRsCSkTBZMzGLm7P7qXeU3jovzIOXdt
	L6+TSwZvTh9l7NrP8kYi6OQg4pRkDkqoQT5TsvX6hu12hxp/oAVV0aSgU8Oc2sCI/3ZYXwkkk3m3+
	sNQr+dVM4xXgRcEfGDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGUA-000000027u9-1Jk3;
	Tue, 04 Aug 2026 14:51:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGU9-000000027u1-0WdZ
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B87CB41383;
	Tue,  4 Aug 2026 14:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA131F000E9;
	Tue,  4 Aug 2026 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855076;
	bh=ebjPrroxsv46bPIAjF8Z9fXkDK1VsFQ1N2mECFHkXjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijOfLo4JbiDNySzrWAmkKceaJO/+AN5fa6japnJsVGkL5jpiylWG3ojmeappGuTOe
	 wKAUTxJAgXOAskXlTjKYVPWq9nM/JWB372xvUNngG4Xgb7mjsLwpnyv3pZ2HlAyfkb
	 ns9zhV97euOl9TUBHZU6S8qKZp3Lyx7KATgnCG4L5e7VDgAC5GPOM/jtHt0gPfbkGu
	 mv4DPpGt8vIL16gjGU+MSd8EwTPZ63PaZ2DLcU3IX7ku8Ml1u5BloEvjsUXp4ctUm8
	 CiwDK7QFJhpYEICFZkvrKptqZKiJH3jyCS4lDL67n8HAY5KZVxC0T3ZXKcvaXcZq8C
	 xAd5iyVdMqy1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 01/14] i3c: master: Fix recursive locking during
 device registration
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260804133810.184905-2-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-2-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:51:15 +0000
Message-Id: <20260804145116.4FA131F000E9@smtp.kernel.org>
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
IFtIaWdoXSBVc2UtQWZ0ZXItRnJlZSBvZiBgaTNjZGV2LT5kZXNjYCBkdXJpbmcgdW5sb2NrZWQg
ZHJpdmVyIGNvcmUgY2FsbGJhY2tzIChlLmcuLCBgaTNjX2RldmljZV9tYXRjaGApIHJhY2luZyB3
aXRoIER5bmFtaWMgQWRkcmVzcyBBc3NpZ25tZW50IChEQUEpLgotLQoKLS0tIFBhdGNoIFsxXTog
W1BBVENIIFYzIDAxLzE0XSBpM2M6IG1hc3RlcjogRml4IHJlY3Vyc2l2ZSBsb2NraW5nIGR1cmlu
ZyBkZXZpY2UgcmVnaXN0cmF0aW9uIC0tLQpjb21taXQgYjk3NGZmM2E5YmZmMDA4YmJjNDg3YTJk
OWIyZDI0YTQ1MzliZmYwNgpBdXRob3I6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50
ZWwuY29tPgoKaTNjOiBtYXN0ZXI6IEZpeCByZWN1cnNpdmUgbG9ja2luZyBkdXJpbmcgZGV2aWNl
IHJlZ2lzdHJhdGlvbgoKVGhpcyBjb21taXQgZml4ZXMgcmVjdXJzaXZlIGxvY2tpbmcgZHVyaW5n
IGkzYyBkZXZpY2UgcmVnaXN0cmF0aW9uIGJ5CnNlcGFyYXRpbmcgZGV2aWNlIGNyZWF0aW9uIGZy
b20gcmVnaXN0cmF0aW9uLiBJdCBwb3B1bGF0ZXMgdGhlIGRldmljZQp1bmRlciB0aGUgbWFpbnRl
bmFuY2UgbG9jaywgY29sbGVjdHMgdW5yZWdpc3RlcmVkIGRldmljZXMgaW50byBhIGxpc3QsCmFu
ZCBjYWxscyBkZXZpY2VfcmVnaXN0ZXIoKSBvbmx5IGFmdGVyIHJlbGVhc2luZyB0aGUgbG9jay4K
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCgpbIC4uLiBdCgo+IEBAIC0yMTA0LDI1ICsyMTEzLDM3IEBAIGkzY19tYXN0ZXJfcmVnaXN0
ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKClsg
Li4uIF0KCj4gKwlpM2NfYnVzX21haW50ZW5hbmNlX3VubG9jaygmbWFzdGVyLT5idXMpOwo+ICsK
PiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShpM2NkZXYsIHRtcCwgJmkzY191bnJlZ19kZXZz
LCBub2RlKSB7Cj4gKwkJcmV0ID0gZGV2aWNlX3JlZ2lzdGVyKCZpM2NkZXYtPmRldik7CgpbU2V2
ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIGRyb3Bw
aW5nIHRoZSBtYWludGVuYW5jZSBsb2NrIGhlcmUKZXhwb3NlIGRyaXZlciBjb3JlIGNhbGxiYWNr
cyB0byBhIHVzZS1hZnRlci1mcmVlIG9mIGkzY2Rldi0+ZGVzYz8KCldoZW4gZGV2aWNlX3JlZ2lz
dGVyKCkgcnVucyB3aXRob3V0IHRoZSBtYWludGVuYW5jZSBsb2NrLCBzeW5jaHJvbm91cyBkcml2
ZXIKY29yZSBjYWxsYmFja3MgbGlrZSBpM2NfZGV2aWNlX21hdGNoKCkgY2FuIGxvY2tsZXNzbHkg
ZGVyZWZlcmVuY2UKaTNjZGV2LT5kZXNjOgoKZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX2Rldmlj
ZV9tYXRjaCgpIHsKICAgIC4uLgogICAgaWYgKGkzY2Rldi0+ZGVzYyAmJiBpM2NkZXYtPmRlc2Mt
PmJvYXJkaW5mbykKICAgICAgICBzdGF0aWNfYWRkcl9tZXRob2QgPSBpM2NkZXYtPmRlc2MtPmJv
YXJkaW5mby0+c3RhdGljX2FkZHJfbWV0aG9kOwogICAgLi4uCn0KCkNvbmN1cnJlbnRseSwgYSBo
b3Qtam9pbiBldmVudCB0cmlnZ2VyaW5nIGR5bmFtaWMgYWRkcmVzcyBhc3NpZ25tZW50IChEQUEp
CmNvdWxkIHRha2UgdGhlIG1haW50ZW5hbmNlIGxvY2sgYW5kIGZyZWUgdGhlIG9sZCBkZXNjcmlw
dG9yIGlmIGl0IGlkZW50aWZpZXMKdGhlIGRldmljZSBhcyBhIGR1cGxpY2F0ZToKCmRyaXZlcnMv
aTNjL21hc3Rlci5jOl9faTNjX21hc3Rlcl9hZGRfaTNjX2Rldl9sb2NrZWQoKSB7CiAgICAuLi4K
ICAgIGkzY19tYXN0ZXJfZGV0YWNoX2kzY19kZXYob2xkZGV2KTsKICAgIGkzY19tYXN0ZXJfZnJl
ZV9pM2NfZGV2KG9sZGRldik7CiAgICAuLi4KfQoKQ291bGQgdGhpcyBzZXF1ZW5jZSBjYXVzZSBh
IHVzZS1hZnRlci1mcmVlIHdoZW4gdGhlIHVubG9ja2VkIGNhbGxiYWNrCnJhY2VzIHdpdGggREFB
IGZyZWVpbmcgdGhlIGR1cGxpY2F0ZSBkZXNjcmlwdG9yPwoKPiArCQlpZiAocmV0KQo+ICsJCQlk
ZXZfZXJyKCZtYXN0ZXItPmRldiwgIkZhaWxlZCB0byBhZGQgSTNDIGRldmljZSAoZXJyID0gJWQp
XG4iLCByZXQpOwo+ICsJCWVsc2UKPiArCQkJbGlzdF9kZWxfaW5pdCgmaTNjZGV2LT5ub2RlKTsK
PiArCX0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA4MDQxMzM4MTAuMTg0OTA1LTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFy
dD0xCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
