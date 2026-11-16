Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AB3606A31C
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Nov 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/Q8UUeG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVILch4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iO0XqMXwj2o5EYYUVZ1c5j0JJPVUSJorL31uckBjqBk=; b=x/Q8UUeGTlJwsLRJVFts1i/+F9
	VD2CftLYTtD6s8swMCXv/E24Fzxe6hLZTTs4leSZC163XMSWaCncYKvV9ZophytuXlPdc/HM8J/2s
	lTecwqPgm8QQ0xySvNiVaF7608S7qxpHinGycCCDsn9gT64JWPObgr54VKaaBso0WakqypaFMHw0Y
	MX6+PaiNY9yfHmRAeejqhAqVLrGvB5YU8vDwJQgza5bIsInDyHIbwpEI1qEK6Q+O0HkAOCO0X2UuX
	Clx2X0JTWWz9tRTaViHVpXrnAIaLHXm1Fht3ZE/ZTZrmpuCheirxsNulU9RxntnKeMMJtBJlHJqv+
	ZJIs+eFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSC-000000023eq-2HCU;
	Mon, 16 Nov 2026 11:00:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuS2-000000023bl-22v0;
	Mon, 16 Nov 2026 11:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECAD543F67;
	Mon, 16 Nov 2026 11:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B3A1F000C8;
	Mon, 16 Nov 2026 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826841;
	bh=q+XKeteplK1QAM0q8mQGCIWBTuExNUI4WhBG5cj2vL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UVILch4Nem2cA9YybFl3BS6qtbmpqV9xesf1KgsHK3LzklRF81ccA/RW0280lkaPd
	 gLF3s1ycPFIerBhTjIEj1jP08m5d67h3BlvPLdraP69mQiW5mEcZmSZ70nhEDqvFlD
	 PV0Ek+wGLuqme1VHFRFrVUDikuyil55o0ekuXUa7ydWoBPLuSxUPEzvijrKwbiCH5l
	 2Rcb7/lfgts9C4RqdmxftVGUomR7ouJKrTCItf4pbNo47eehOxshYPbmxQjJGQPeN7
	 UoERM/oO9eSoU53X8xxMHMq+rZMWl3oCmqk9qtj5CB6gNlBEzrJvi6gdiNZVybsyBP
	 CMKHUZB2y4zEQ==
Message-ID: <sashiko-outbox-216820@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261116-a9_i3c-v4-1-3d3222b7128d@amlogic.com>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-1-3d3222b7128d@amlogic.com>
Date: Mon, 16 Nov 2026 11:00:40 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGkzYzog
c2lsdmFjbzogdW53aWVsZHkgcGVyLWNvbXBhdGlibGUgY2xvY2sKICBjb25kaXRpb25hbHMKLS0K
CmNvbW1pdCAyNTFlZDIzZmU0ZGU5N2YzZWY5MDU5N2VlYmQ2YzY0ZDhhY2QxODhhCkF1dGhvcjog
SnVueWkgWmhhbyA8anVueWkuemhhb0BhbWxvZ2ljLmNvbT4KCmR0LWJpbmRpbmdzOiBpM2M6IHNp
bHZhY28saTNjLW1hc3RlcjogQWRkIEFtbG9naWMgQTkgc3VwcG9ydAoKVGhpcyBjb21taXQgYWRk
cyB0aGUgYW1sb2dpYyxhOS1pM2MgYW5kIGFtbG9naWMsYTktYW8taTNjIGNvbXBhdGlibGVzIGFu
ZAp0aGVpciBwZXItY29tcGF0aWJsZSBjbG9jayBjb25zdHJhaW50cyB0byB0aGUgU2lsdmFjbyBJ
M0MgbWFzdGVyIGRldmljZSB0cmVlCmJpbmRpbmcgc2NoZW1hLgoKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9zaWx2YWNvLGkzYy1tYXN0ZXIueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFz
dGVyLnlhbWwKPiBpbmRleCA4NTMwOTJmNzUyMmQzLi5kODkyZDQyYmVlNjVjIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFz
dGVyLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3Np
bHZhY28saTNjLW1hc3Rlci55YW1sCj4gQEAgLTEzLDYgKzEzLDggQEAgcHJvcGVydGllczoKPiAg
ICBjb21wYXRpYmxlOgo+ICAgICAgb25lT2Y6Cj4gICAgICAgIC0gZW51bToKPiArICAgICAgICAg
IC0gYW1sb2dpYyxhOS1pM2MKPiArICAgICAgICAgIC0gYW1sb2dpYyxhOS1hby1pM2MKPiAgICAg
ICAgICAgIC0gbnV2b3RvbixucGNtODQ1LWkzYwo+ICAgICAgICAgICAgLSBzaWx2YWNvLGkzYy1t
YXN0ZXItdjEKPiAgICAgICAgLSBpdGVtczoKPiBAQCAtMjgsMTQgKzMwLDE0IEBAIHByb3BlcnRp
ZXM6Cj4gICAgICBtYXhJdGVtczogMQo+ICAKPiAgICBjbG9ja3M6Cj4gLSAgICBtaW5JdGVtczog
Mgo+ICsgICAgbWluSXRlbXM6IDEKPiAgICAgIGl0ZW1zOgo+ICAgICAgICAtIGRlc2NyaXB0aW9u
OiBzeXN0ZW0gY2xvY2sKPiAgICAgICAgLSBkZXNjcmlwdGlvbjogYnVzIGNsb2NrCj4gICAgICAg
IC0gZGVzY3JpcHRpb246IG90aGVyIChzbG93ZXIpIGV2ZW50cyBjbG9jawo+ICAKPiAgICBjbG9j
ay1uYW1lczoKPiAtICAgIG1pbkl0ZW1zOiAyCj4gKyAgICBtaW5JdGVtczogMQo+ICAgICAgaXRl
bXM6Cj4gICAgICAgIC0gY29uc3Q6IHBjbGsKPiAgICAgICAgLSBjb25zdDogZmFzdF9jbGsKPiBA
QCAtNzAsMTUgKzcyLDM1IEBAIGFsbE9mOgo+ICAgICAgICAgIGNvbXBhdGlibGU6Cj4gICAgICAg
ICAgICBjb250YWluczoKPiAgICAgICAgICAgICAgZW51bToKPiArICAgICAgICAgICAgICAtIGFt
bG9naWMsYTktaTNjCj4gICAgICAgICAgICAgICAgLSBueHAsaW14OTQtaTNjCj4gICAgICAgICAg
ICAgICAgLSBueHAsaW14OTUtaTNjCj4gICAgICB0aGVuOgo+ICAgICAgICBwcm9wZXJ0aWVzOgo+
ICAgICAgICAgIGNsb2NrczoKPiArICAgICAgICAgIG1pbkl0ZW1zOiAyCj4gICAgICAgICAgICBt
YXhJdGVtczogMgo+ICAgICAgICAgIGNsb2NrLW5hbWVzOgo+ICsgICAgICAgICAgbWluSXRlbXM6
IDIKPiAgICAgICAgICAgIG1heEl0ZW1zOiAyCj4gIAo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsg
ICAgICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxhOS1hby1pM2MKPiAr
ICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgY2xvY2tzOgo+ICsgICAg
ICAgICAgbWF4SXRlbXM6IDEKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAg
ICBUaGUgImFvIiB2YXJpYW50IGlzIHRoZSBjb250cm9sbGVyIGluc3RhbmNlIGluIHRoZSBBbHdh
eXMtT24gKEFPKQo+ICsgICAgICAgICAgICBkb21haW4sIHdoaWNoIGhhcyBubyBzZXBhcmF0ZSBi
dXMgY2xvY2sgYW5kIGRlcml2ZXMgdGhlCj4gKyAgICAgICAgICAgIGJ1cyBjbG9jayBmcm9tIGFu
IGludGVybmFsIGRpdmlkZXIuCj4gKyAgICAgICAgY2xvY2stbmFtZXM6Cj4gKyAgICAgICAgICBt
YXhJdGVtczogMQoKW1NldmVyaXR5OiBMb3ddClNob3VsZCB0aGUgQW1sb2dpYyB2YXJpYW50cyBi
ZSBzcGxpdCBpbnRvIGEgc2VwYXJhdGUgYmluZGluZyBzY2hlbWEgaW5zdGVhZApvZiBhZGRpbmcg
bW9yZSBwZXItY29tcGF0aWJsZSBpZi90aGVuIGNsb2NrIGNvbmRpdGlvbmFscyBoZXJlPwoKTmVp
dGhlciBhbWxvZ2ljLGE5LWkzYyBub3IgYW1sb2dpYyxhOS1hby1pM2MgdXNlcyB0aGUgc2lsdmFj
byxpM2MtbWFzdGVyLXYxCmZhbGxiYWNrLCBhbmQgYWNjb21tb2RhdGluZyB0aGUgc2luZ2xlLWNs
b2NrIEFPIHZhcmlhbnQgd2Vha2VucyB0aGUKdG9wLWxldmVsIGNsb2NrcyBhbmQgY2xvY2stbmFt
ZXMgbWluSXRlbXMgdG8gMSBzbyB0aGF0IDEtY2xvY2ssIDItY2xvY2ssIGFuZAozLWNsb2NrIGlu
dGVncmF0aW9ucyBhbGwgaGF2ZSB0byBiZSBjb25zdHJhaW5lZCB0aHJvdWdoIHNlcGFyYXRlIGlm
L3RoZW4KYmxvY2tzIGluIGFsbE9mIChpbmNsdWRpbmcgYSB2YXJpYW50LXNwZWNpZmljIGNsb2Nr
cyBkZXNjcmlwdGlvbiBpbnNpZGUgYQpjb25kaXRpb25hbCBibG9jaykuCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTE2LWE5X2kz
Yy12NC0wLTNkMzIyMmI3MTI4ZEBhbWxvZ2ljLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
