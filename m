Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0A606A329
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Nov 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SH8Dkbrs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPb5vqkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E+4moQjtrQas1yBFK6KNYbwtQwCi7Reectpvn1fRfH8=; b=SH8Dkbrs82YSBz74MmlzPfNKZo
	hldNjCvYXRVqNM8Lr24E5QCcXXYRdlfE/mtj1icLgryFH7gLXX5/uA3EQmT2s2vwU1gM8LnB4Oye0
	aHz7HvPu3IHDJsIdHTsABPVZBAwp4DQOvzykqj+SBJlqRaJ6FeOm0qdiIJaKHncqzwy7BsG+V1P9W
	T+1HwyEOuOZqvMTXfFpke8+FxxL9F1CFGwb9KU+EL7j+7gmm0PRLL2z7oG6xUU/5e7/sHpaOSYRJf
	2EyKPoSHlz+ZVWdeB/bGiAC0b8xx1zp4ZmnK8582hQoS0Pk9fMlADooljEWojo7o/yKWOsG89oCgO
	AYLZX+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEHt-0000000BR6L-4Bsg;
	Fri, 06 Nov 2026 07:23:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEHs-0000000BR5z-1Fh1;
	Fri, 06 Nov 2026 07:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D81B40103;
	Fri,  6 Nov 2026 07:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3DC1F0089F;
	Fri,  6 Nov 2026 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949779;
	bh=l+JJGuwRJM3z7N4kO/kgTH54i4ethXSyzCMfLiGeBfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPb5vqkp5peh+FGlxrIgMbxTsFX0re3sCatibuw+wXpGnX23nZuzPubjmu6xawIPT
	 t0Hxcx27XKGjFyI7yEreLaIVcvB4P3PViVEdmTI5ymxZP64EzPduNxBt2X/4SnBEpA
	 KTZKM741SufHk5Jw4O4P/B4hlRjB1gA55MOu6a3YTqOBEsyBLDbBMMeNu2plgk1ak/
	 n3YLpy42Hp8f/l8CnltK/dKphS6VwyVuVJoQLZFtpam1tMJK5rfyLtLIz9fE0+ja2p
	 hCwY9yRaafS8Q9ARA+dp7MhTRnFsMLsjYBjDfSWi8QwVJnwcADgqkOqpkmbfQV3YiO
	 aLennEEUfvdvA==
Message-ID: <sashiko-outbox-200991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
Date: Fri, 06 Nov 2026 07:22:59 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtMb3ddIGR0LWJpbmRpbmdzOiBpM2M6
IHNpbHZhY286IHVud2llbGR5IHBlci1jb21wYXRpYmxlIGNsb2NrCiAgY29uZGl0aW9uYWxzCi0g
W0xvd10gZHQtYmluZGluZ3M6IGkzYzogc2lsdmFjbzogc2luZ2xlLWl0ZW0gZW51bSBhbmQgZGVz
Y3JpcHRpb24gaW4KICBpZi90aGVuCi0tCgpjb21taXQgZGJhYzQ0MzZlY2MzZjg1N2VmMGZhN2Ri
ZTEwZDBmZDUxMTZjZGIyZApBdXRob3I6IEp1bnlpIFpoYW8gPGp1bnlpLnpoYW9AYW1sb2dpYy5j
b20+CgpkdC1iaW5kaW5nczogaTNjOiBzaWx2YWNvLGkzYy1tYXN0ZXI6IEFkZCBBbWxvZ2ljIEE5
IHN1cHBvcnQKClRoaXMgY29tbWl0IGFkZHMgdGhlIGFtbG9naWMsYTktaTNjIGFuZCBhbWxvZ2lj
LGE5LWFvLWkzYyBjb21wYXRpYmxlCnN0cmluZ3MgYW5kIHRoZWlyIHBlci12YXJpYW50IGNsb2Nr
IGNvbnN0cmFpbnRzIHRvIHRoZSBTaWx2YWNvIEkzQyBtYXN0ZXIKRGV2aWNlIFRyZWUgYmluZGlu
ZyBzY2hlbWEuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTNjL3NpbHZhY28saTNjLW1hc3Rlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kzYy9zaWx2YWNvLGkzYy1tYXN0ZXIueWFtbAo+IGluZGV4IDg1MzA5MmY3NTIy
ZDMuLmQ4OTJkNDJiZWU2NWMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kzYy9zaWx2YWNvLGkzYy1tYXN0ZXIueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc2lsdmFjbyxpM2MtbWFzdGVyLnlhbWwKPiBAQCAt
MTMsNiArMTMsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgIGNvbXBhdGlibGU6Cj4gICAgICBvbmVPZjoK
PiAgICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAgLSBhbWxvZ2ljLGE5LWkzYwo+ICsgICAgICAg
ICAgLSBhbWxvZ2ljLGE5LWFvLWkzYwo+ICAgICAgICAgICAgLSBudXZvdG9uLG5wY204NDUtaTNj
Cj4gICAgICAgICAgICAtIHNpbHZhY28saTNjLW1hc3Rlci12MQo+ICAgICAgICAtIGl0ZW1zOgo+
IEBAIC0yOCwxNCArMzAsMTQgQEAgcHJvcGVydGllczoKPiAgICAgIG1heEl0ZW1zOiAxCj4gIAo+
ICAgIGNsb2NrczoKPiAtICAgIG1pbkl0ZW1zOiAyCj4gKyAgICBtaW5JdGVtczogMQo+ICAgICAg
aXRlbXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IHN5c3RlbSBjbG9jawo+ICAgICAgICAtIGRl
c2NyaXB0aW9uOiBidXMgY2xvY2sKPiAgICAgICAgLSBkZXNjcmlwdGlvbjogb3RoZXIgKHNsb3dl
cikgZXZlbnRzIGNsb2NrCj4gIAo+ICAgIGNsb2NrLW5hbWVzOgo+IC0gICAgbWluSXRlbXM6IDIK
PiArICAgIG1pbkl0ZW1zOiAxCj4gICAgICBpdGVtczoKPiAgICAgICAgLSBjb25zdDogcGNsawo+
ICAgICAgICAtIGNvbnN0OiBmYXN0X2Nsawo+IEBAIC03MCwxNSArNzIsMzUgQEAgYWxsT2Y6Cj4g
ICAgICAgICAgY29tcGF0aWJsZToKPiAgICAgICAgICAgIGNvbnRhaW5zOgo+ICAgICAgICAgICAg
ICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxhOS1pM2MKPiAgICAgICAgICAgICAg
ICAtIG54cCxpbXg5NC1pM2MKPiAgICAgICAgICAgICAgICAtIG54cCxpbXg5NS1pM2MKPiAgICAg
IHRoZW46Cj4gICAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAgICAgY2xvY2tzOgo+ICsgICAgICAg
ICAgbWluSXRlbXM6IDIKPiAgICAgICAgICAgIG1heEl0ZW1zOiAyCj4gICAgICAgICAgY2xvY2st
bmFtZXM6Cj4gKyAgICAgICAgICBtaW5JdGVtczogMgo+ICAgICAgICAgICAgbWF4SXRlbXM6IDIK
CltTZXZlcml0eTogTG93XQpTaG91bGQgdGhlIEFtbG9naWMgQTkgdmFyaWFudHMgYmUgc3BsaXQg
aW50byBhIHNlcGFyYXRlIGJpbmRpbmcgc2NoZW1hCmluc3RlYWQgb2YgYWRkaW5nIG1vcmUgcGVy
LWNvbXBhdGlibGUgY29uZGl0aW9uYWxzIGhlcmU/CgpOZWl0aGVyIGFtbG9naWMsYTktaTNjIG5v
ciBhbWxvZ2ljLGE5LWFvLWkzYyB1c2VzIHRoZSBzaWx2YWNvLGkzYy1tYXN0ZXItdjEKZmFsbGJh
Y2ssIGFuZCBhY2NvbW1vZGF0aW5nIHRoZSAxLWNsb2NrIEFPIHZhcmlhbnQgd2Vha2VucyB0aGUg
dG9wLWxldmVsCmNsb2NrcyBhbmQgY2xvY2stbmFtZXMgbWluSXRlbXMgdG8gMSBzbyB0aGF0IDMt
Y2xvY2ssIDItY2xvY2ssIGFuZCAxLWNsb2NrCnZhcmlhbnRzIGFsbCBoYXZlIHRvIGJlIGNvbnN0
cmFpbmVkIHZpYSBzZXBhcmF0ZSBpZi90aGVuIGJsb2NrcyBpbiBhbGxPZi4KCj4gKwo+ICsgIC0g
aWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAg
ICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gYW1s
b2dpYyxhOS1hby1pM2MKPiArICAgIHRoZW46Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAg
ICAgY2xvY2tzOgo+ICsgICAgICAgICAgbWF4SXRlbXM6IDEKPiArICAgICAgICAgIGRlc2NyaXB0
aW9uOgo+ICsgICAgICAgICAgICBUaGUgImFvIiB2YXJpYW50IGlzIHRoZSBjb250cm9sbGVyIGlu
c3RhbmNlIGluIHRoZSBBbHdheXMtT24gKEFPKQo+ICsgICAgICAgICAgICBkb21haW4sIHdoaWNo
IGhhcyBubyBzZXBhcmF0ZSBidXMgY2xvY2sgYW5kIGRlcml2ZXMgdGhlCj4gKyAgICAgICAgICAg
IGJ1cyBjbG9jayBmcm9tIGFuIGludGVybmFsIGRpdmlkZXIuCj4gKyAgICAgICAgY2xvY2stbmFt
ZXM6Cj4gKyAgICAgICAgICBtYXhJdGVtczogMQoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhpcyBu
ZXcgaWYvdGhlbiBibG9jayBwYXNzIGR0X2JpbmRpbmdfY2hlY2s/CgpUaGUgZHRzY2hlbWEgbWV0
YS1zY2hlbWEgcmVxdWlyZXMgZW51bSBhcnJheXMgdG8gaGF2ZSBhdCBsZWFzdCB0d28gaXRlbXMs
CnNvIG1hdGNoaW5nIHRoZSBzaW5nbGUgYW1sb2dpYyxhOS1hby1pM2Mgc3RyaW5nIHVuZGVyIGNv
bnRhaW5zIG5lZWRzIGNvbnN0CnJhdGhlciB0aGFuIGEgc2luZ2xlLWVudHJ5IGVudW0uICBBbHNv
LCBwcm9wZXJ0eSBkZXNjcmlwdGlvbnMgYmVsb25nIGluIHRoZQp0b3AtbGV2ZWwgcHJvcGVydGll
cyBibG9jayByYXRoZXIgdGhhbiBpbnNpZGUgYW4gaWYvdGhlbiBjb25kaXRpb25hbC4KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEx
MDYtYTlfaTNjLXYzLTAtODA0YjY5YjkwOTViQGFtbG9naWMuY29tP3BhcnQ9MgoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
