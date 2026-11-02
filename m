Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31B606A324
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2026 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x10wk5Zf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBJgUvxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WwTHOlP98TIN3LN9nI68wRTZ51SXfi+unNG9xnOu2k8=; b=x10wk5ZfbNo67WgoUnqzlVULVW
	+sv2CgxjTpTlWFf6yb2RbBGVVc0U35SDsjJWOMqOMH2yEscg8U416DLRei1ZYw9uMKKmvhQJVR1su
	JF6BGJUYRjqstGV2U6rutkjLdFjAI/Eu7GI+frTw/B+YqHX+5uHmjOGK4nZr8m9mB/k+2qvhzhucT
	OIbPuj7WteIYG9Vq9xvT9AYmIW91EBdWywNiVmr+mNQnV+MgyEE7pplAEhuwFgG0Mq6xEUfhZPIGV
	NiSDVXNgpT29AKFT5QmjWRuoRO0MCkArRr3pY8xy0uO3J2tgLKR2qDgZDgdYCdyN9mN+oL83QTg91
	RX8dP/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq21-0000000GHd5-1kuv;
	Mon, 02 Nov 2026 11:16:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq20-0000000GHcY-12ZM;
	Mon, 02 Nov 2026 11:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C97360DD8;
	Mon,  2 Nov 2026 11:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CF91F00A1B;
	Mon,  2 Nov 2026 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618211;
	bh=yAiN693EoE8Bv9AfkhxHQHZO02i5vG4nfF8UEUAX4DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBJgUvxgoTPg5T5Qmv2EvBcUPlsR0aAeYVYrqLoA8ZnCl2H4A8+uMEy82wjHu6eJA
	 rxKwGH8Z/uJnhtLLLhrMriJ2OyBIDS81m5uTjET7CZIXIETX4MSrcTv2ruEbUpAtVd
	 xdBxAaffXh8yGAcsCvEsW7t17gIum9IlVPmJX9ffwCOqsVeWLXAU9UYGErVcrKagNU
	 7NIjV3Y1b6Vy9yv5rNzDWjzG+XvKzmcthqOFOjK41wJqBsfMAIrZDaJ3rIQ7wHFPau
	 hc9xc9XjBOGZ1zWmhqY/E9NJb+fff0Ri8przHBzMEWA/MGzUHuo6rDWqVWzJx6kubr
	 lHZW4/JozhRgQ==
Message-ID: <sashiko-outbox-193325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
Date: Mon, 02 Nov 2026 11:16:50 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IGkzYzogc2lsdmFjbzogdW53aWVsZHkgY29uZGl0aW9uYWxzIGFuZCBpbnZhbGlkIGZhbGxiYWNr
Ci0tCgpjb21taXQgMGFmNzg5NGMyMTNmNTM0NmVmYjVhMWYxMzYwZGZmNWE3YTE3MDRiYgpBdXRo
b3I6IEp1bnlpIFpoYW8gPGp1bnlpLnpoYW9AYW1sb2dpYy5jb20+CgpkdC1iaW5kaW5nczogaTNj
OiBzaWx2YWNvLGkzYy1tYXN0ZXI6IEFkZCBBbWxvZ2ljIEE5IHN1cHBvcnQKClRoaXMgY29tbWl0
IGFkZHMgQW1sb2dpYyBBOSBJM0MgY29udHJvbGxlciBjb21wYXRpYmxlcyAoYW1sb2dpYyxhOS1p
M2MgYW5kCmFtbG9naWMsYTktYW8taTNjKSB3aXRoIGEgc2lsdmFjbyxpM2MtbWFzdGVyLXYxIGZh
bGxiYWNrIHRvIHRoZSBTaWx2YWNvIEkzQwptYXN0ZXIgRGV2aWNlIFRyZWUgYmluZGluZyBzY2hl
bWEgYW5kIGFkanVzdHMgdGhlIGNsb2NrIGNvdW50IGNvbnN0cmFpbnRzIGZvcgplYWNoIHZhcmlh
bnQuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNj
L3NpbHZhY28saTNjLW1hc3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9zaWx2YWNvLGkzYy1tYXN0ZXIueWFtbAo+IGluZGV4IDg1MzA5MmY3NTIyZDMuLmRl
MWZkZWM2NTRhMjYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9zaWx2YWNvLGkzYy1tYXN0ZXIueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFzdGVyLnlhbWwKPiBAQCAtMTksNiAr
MTksOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBlbnVtOgo+ICAgICAgICAgICAgICAg
IC0gbnhwLGlteDk0LWkzYwo+ICAgICAgICAgICAgICAgIC0gbnhwLGlteDk1LWkzYwo+ICsgICAg
ICAgICAgICAgIC0gYW1sb2dpYyxhOS1pM2MKPiArICAgICAgICAgICAgICAtIGFtbG9naWMsYTkt
YW8taTNjCj4gICAgICAgICAgICAtIGNvbnN0OiBzaWx2YWNvLGkzYy1tYXN0ZXItdjEKPiAgCj4g
ICAgcmVnOgo+IEBAIC0yOCwxNCArMzAsMTQgQEAgcHJvcGVydGllczoKPiAgICAgIG1heEl0ZW1z
OiAxCj4gIAo+ICAgIGNsb2NrczoKPiAtICAgIG1pbkl0ZW1zOiAyCj4gKyAgICBtaW5JdGVtczog
MQo+ICAgICAgaXRlbXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IHN5c3RlbSBjbG9jawo+ICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBidXMgY2xvY2sKPiAgICAgICAgLSBkZXNjcmlwdGlvbjogb3Ro
ZXIgKHNsb3dlcikgZXZlbnRzIGNsb2NrCj4gIAo+ICAgIGNsb2NrLW5hbWVzOgo+IC0gICAgbWlu
SXRlbXM6IDIKPiArICAgIG1pbkl0ZW1zOiAxCj4gICAgICBpdGVtczoKPiAgICAgICAgLSBjb25z
dDogcGNsawo+ICAgICAgICAtIGNvbnN0OiBmYXN0X2Nsawo+IEBAIC03MiwxMiArNzQsMzAgQEAg
YWxsT2Y6Cj4gICAgICAgICAgICAgIGVudW06Cj4gICAgICAgICAgICAgICAgLSBueHAsaW14OTQt
aTNjCj4gICAgICAgICAgICAgICAgLSBueHAsaW14OTUtaTNjCj4gKyAgICAgICAgICAgICAgLSBh
bWxvZ2ljLGE5LWkzYwo+ICAgICAgdGhlbjoKPiAgICAgICAgcHJvcGVydGllczoKPiAgICAgICAg
ICBjbG9ja3M6Cj4gKyAgICAgICAgICBtaW5JdGVtczogMgo+ICAgICAgICAgICAgbWF4SXRlbXM6
IDIKPiAgICAgICAgICBjbG9jay1uYW1lczoKPiArICAgICAgICAgIG1pbkl0ZW1zOiAyCj4gICAg
ICAgICAgICBtYXhJdGVtczogMgo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAg
ICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBj
b25zdDogYW1sb2dpYyxhOS1hby1pM2MKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6
Cj4gKyAgICAgICAgY2xvY2tzOgo+ICsgICAgICAgICAgbWF4SXRlbXM6IDEKPiArICAgICAgICAg
IGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBUaGUgImFvIiB2YXJpYW50IGlzIHRoZSBjb250
cm9sbGVyIGluc3RhbmNlIGluIHRoZSBBbHdheXMtT24gKEFPKQo+ICsgICAgICAgICAgICBkb21h
aW4sIHdoaWNoIGhhcyBubyBzZXBhcmF0ZSBidXMgY2xvY2sgYW5kIGRlcml2ZXMgdGhlCj4gKyAg
ICAgICAgICAgIGJ1cyBjbG9jayBmcm9tIGFuIGludGVybmFsIGRpdmlkZXIuCj4gKyAgICAgICAg
Y2xvY2stbmFtZXM6Cj4gKyAgICAgICAgICBtYXhJdGVtczogMQoKW1NldmVyaXR5OiBNZWRpdW1d
CldpdGggdGhlIHRvcC1sZXZlbCBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIG1pbkl0ZW1zIGxvd2Vy
ZWQgdG8gMSBhbmQgYSB0aGlyZAppZi10aGVuIGNvbmRpdGlvbmFsIGJsb2NrIGFkZGVkIHVuZGVy
IGFsbE9mIHRvIGhhbmRsZSAxLWNsb2NrLCAyLWNsb2NrLCBhbmQKMy1jbG9jayB2YXJpYW50cywg
dGhlIHBlci1jb21wYXRpYmxlIGNvbmRpdGlvbmFscyBpbiBzaWx2YWNvLGkzYy1tYXN0ZXIueWFt
bAphcmUgYmVjb21pbmcgdW53aWVsZHkuIFNpbmNlIHRoZSBBbWxvZ2ljIHZhcmlhbnRzIChlc3Bl
Y2lhbGx5IHRoZSBBTyBkb21haW4KaW5zdGFuY2Ugd2l0aCBpdHMgaW50ZXJuYWwgYnVzIGNsb2Nr
IGRpdmlkZXIpIGRpZmZlciBzaWduaWZpY2FudGx5IGZyb20gdGhlCmJhc2UgYmluZGluZywgd291
bGQgaXQgYmUgY2xlYW5lciB0byBzcGxpdCB0aGUgQW1sb2dpYyBiaW5kaW5nIGludG8gYQpzZXBh
cmF0ZSBzY2hlbWEgZG9jdW1lbnQgcmF0aGVyIHRoYW4gcGlsaW5nIG1vcmUgY29uZGl0aW9uYWxz
IGludG8gdGhpcyBmaWxlPwoKQWxzbywgaXMgc2lsdmFjbyxpM2MtbWFzdGVyLXYxIGFuIGFwcHJv
cHJpYXRlIGZhbGxiYWNrIGNvbXBhdGlibGUgZm9yCmFtbG9naWMsYTktaTNjIGFuZCBhbWxvZ2lj
LGE5LWFvLWkzYz8KCklmIGEgZGV2aWNlIHRyZWUgbm9kZSBmb3IgYW1sb2dpYyxhOS1hby1pM2Mg
YmluZHMgdmlhIHRoZSBnZW5lcmljCnNpbHZhY28saTNjLW1hc3Rlci12MSBjb21wYXRpYmxlICh3
aGljaCB1c2VzIHN2Y19kZWZhdWx0X2RydmRhdGEgd2l0aG91dCBhCnZlbmRvcl9pbml0IGNhbGxi
YWNrKSwgc3ZjX2kzY19tYXN0ZXJfcHJvYmUoKSBsb29rcyB1cCBmYXN0X2NsayBpbgptYXN0ZXIt
PmNsa3MgYW5kIGZhaWxzIHdpdGggLUVJTlZBTCBiZWNhdXNlIGZhc3RfY2xrIGlzIGFic2VudCBm
cm9tIHRoZQpEZXZpY2UgVHJlZSBhbmQgdGhlIGludGVybmFsIGNsb2NrIGRpdmlkZXIgYXQgb2Zm
c2V0IDB4MzA0IGlzIG5ldmVyCnJlZ2lzdGVyZWQuIFNpbWlsYXJseSwgYW1sb2dpYyxhOS1pM2Mg
cmVxdWlyZXMgQW1sb2dpYy1zcGVjaWZpYyBmYXN0X2NsayByYXRlCnNldHVwIGluIGFtbF9pM2Nf
aW5pdCgpIGFuZCBoYXJkd2FyZSBxdWlya3MgKFNWQ19JM0NfUVVJUktfRklGT19FTVBUWSwKU1ZD
X0kzQ19RVUlSS19GQUxTRV9TTFZTVEFSVCwgYW5kIFNWQ19JM0NfUVVJUktfREFBX0NPUlJVUFQp
IHRvIG9wZXJhdGUsCm11Y2ggbGlrZSBudXZvdG9uLG5wY204NDUtaTNjIHdoaWNoIGRvZXMgbm90
IHVzZSBzaWx2YWNvLGkzYy1tYXN0ZXItdjEgYXMgYQpmYWxsYmFjay4KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDItYTlfaTNj
LXYyLTAtMGM0NzRiZmNjZmZhQGFtbG9naWMuY29tP3BhcnQ9MgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
