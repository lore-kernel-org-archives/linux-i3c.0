Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB0606A323
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Nov 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qv72ydUi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBPJjp+g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6urlHSrw5qPDzpx0S1CVMsca24pyrcmO7D9RQU3HMrA=; b=Qv72ydUio2SEe+KEnCvrFt3jsS
	ixenJf8qTBKiNv4wp+sCvzfSQdPJwH1+yVU9n4naLry5oLYw8onObCHnOIDccp1jKXUu6JRGQ1VCH
	Duw6aO7Ys4v/KsHc7rxMS+bctLMcQ6F0lDNUbyMFLMfuZ07oF9MFHNAFjVWsQ9cLl18P60HJM9yYE
	xw3J1fa5cSKpr3j/uK+Y9qjxd8ZMnOcYIx9SmBuk36LDnJhTpIlWZRtSZ+CTY3SSUy5QaeD5FZ8Hp
	1SHoNlj9wuPMNyDPLTm+WLYs2KANsPq3bzcQ0zUjru1byKNTlr6r9cXD5ovSuwuvUjiMQVHNJeMsq
	AGIcaBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMRj-00000000O6A-3D1V;
	Mon, 09 Nov 2026 10:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMRh-00000000O5g-1d1V;
	Mon, 09 Nov 2026 10:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B1C762B96;
	Mon,  9 Nov 2026 10:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC461F0089F;
	Mon,  9 Nov 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219467;
	bh=Ic7jHUfVZKqM2TKIUT0rc5yz6Z3PrS89BpZFZ+a+Jzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBPJjp+gHW5kzA3N2B/1DVWywmDXUy459v5nXcSoeQv9eGyqPE7KRG+BaJdelgjiE
	 IMNkLvuvIFOwOPdSASYqn31ocuI3nBtrdKWPvrVhoEUivf9h1ER6FNUCjEl8WIhBsP
	 5X7YbBbvAvZBfchMek1jQhdVmKRuhbS2s6Ib0KrCJkx9YJmAF4tO1TgvN9MHGcwfzx
	 VWxXVtK511vxCSbNT5aNlI48Xi+ZshWS0n1cg8YzVVczz8r2MJEXfob1psi/gqE9pR
	 L36KsI8PZBfYhA2HFvA168MKXcvAscLYwHCNx1sAHRbYcWG/uy5MJ2vfeIJ9+oEPDG
	 8eSQCRUdQRwFg==
Date: Mon, 9 Nov 2026 11:17:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, 
	neil.armstrong@linaro.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
Message-ID: <20261109-meticulous-salamander-of-ampleness-a74ce6@quoll>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
 <sashiko-outbox-200991@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-200991@kernel.org>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMDc6MjI6NTlBTSArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToKPiA+ICsgIC0gaWY6Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsg
ICAgICAgIGNvbXBhdGlibGU6Cj4gPiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gKyAgICAgICAg
ICAgIGVudW06Cj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsYTktYW8taTNjCj4gPiArICAg
IHRoZW46Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIGNsb2NrczoKPiA+ICsg
ICAgICAgICAgbWF4SXRlbXM6IDEKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4gPiArICAg
ICAgICAgICAgVGhlICJhbyIgdmFyaWFudCBpcyB0aGUgY29udHJvbGxlciBpbnN0YW5jZSBpbiB0
aGUgQWx3YXlzLU9uIChBTykKPiA+ICsgICAgICAgICAgICBkb21haW4sIHdoaWNoIGhhcyBubyBz
ZXBhcmF0ZSBidXMgY2xvY2sgYW5kIGRlcml2ZXMgdGhlCj4gPiArICAgICAgICAgICAgYnVzIGNs
b2NrIGZyb20gYW4gaW50ZXJuYWwgZGl2aWRlci4KPiA+ICsgICAgICAgIGNsb2NrLW5hbWVzOgo+
ID4gKyAgICAgICAgICBtYXhJdGVtczogMQo+IAo+IFtTZXZlcml0eTogTG93XQo+IERvZXMgdGhp
cyBuZXcgaWYvdGhlbiBibG9jayBwYXNzIGR0X2JpbmRpbmdfY2hlY2s/Cj4gCj4gVGhlIGR0c2No
ZW1hIG1ldGEtc2NoZW1hIHJlcXVpcmVzIGVudW0gYXJyYXlzIHRvIGhhdmUgYXQgbGVhc3QgdHdv
IGl0ZW1zLAo+IHNvIG1hdGNoaW5nIHRoZSBzaW5nbGUgYW1sb2dpYyxhOS1hby1pM2Mgc3RyaW5n
IHVuZGVyIGNvbnRhaW5zIG5lZWRzIGNvbnN0Cj4gcmF0aGVyIHRoYW4gYSBzaW5nbGUtZW50cnkg
ZW51bS4gIEFsc28sIHByb3BlcnR5IGRlc2NyaXB0aW9ucyBiZWxvbmcgaW4gdGhlCj4gdG9wLWxl
dmVsIHByb3BlcnRpZXMgYmxvY2sgcmF0aGVyIHRoYW4gaW5zaWRlIGFuIGlmL3RoZW4gY29uZGl0
aW9uYWwuCgpGZWVscyBsaWtlIGhhbGx1Y2luYXRpb24KCj4gCj4gLS0gCj4gU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA2LWE5X2kzYy12
My0wLTgwNGI2OWI5MDk1YkBhbWxvZ2ljLmNvbT9wYXJ0PTIKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
