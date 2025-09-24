Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30E0CAC5B1
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 16:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tt8z52tHOFSHIMM50z9p84JWtSVUAX0Yy0Tj6YcSUUI=; b=ezJn0UMnhU0bzw
	OhkL+A6pY29tynDrbBtCKIK+OMqxAlqG52uPAHP8tnnyZKYmAspDnT5NJ6nVSKDJ6UH6MhSgTakyL
	0bAhkghPh+PMVCoEveOMUtWpOVk+rHnC8pJP61tycXHYRPBhh2wxdG6zRtC2snwtbs79Tin93cUNS
	mdpZU7DO0FSIYA+7bTdXSsyHs98IlpuHrJiCc62jGU5q/hBubgSGoeQEs7Q4L06HZK9CFJfhKOKJQ
	XQ5/PDA5ldVAEFbRlTeaFRHjsdeFsPt+TwDjdxoNxNPdH7Nx5h95V5joCJTOWgtN6uKm1UIGHJg/3
	Mh47xHGcLs62Sh+W2ggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SS0-00000001l76-1Spl;
	Wed, 24 Sep 2025 16:34:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SRx-00000001l5O-2AT0
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 16:34:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso72200f8f.1
        for <linux-i3c@lists.infradead.org>; Wed, 24 Sep 2025 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758731675; x=1759336475; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ArNEHc23GpAhtyDj0RZTGS3tjfuBxBH3HMLWunMO3p4=;
        b=CJRKMEncEPGTe7jE+x9ujdUe0sNJoxQwwbTXvy6AKvIlT8gez2MINPX9jMA+mRAH04
         7zzZjeMmMx1m7WRAVyo0O5ZlHcZyQr1byPjkxBT7dFvTP3n3XPEBlMmfqvCc/uBFS4s4
         r7rKlM9lOxGYqITj60epqiu0V+I+q+MhhFLgZMan3uw80OLOxzmBmpB1GbQ3VZwcT23G
         URVrzMm0hOVd3odVZvy3tajkr0QbCDCFJwamgGZ3m0YLeii3pMuDkoSf4G4QpoVebo8N
         sDt81M82qo+gztx+QqccEFW8StY4LtThwgevRzNLhk7JWDC2+ThYTdv4UVL8K6Qw4I2B
         0YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758731675; x=1759336475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArNEHc23GpAhtyDj0RZTGS3tjfuBxBH3HMLWunMO3p4=;
        b=ZBcBHD1rQZt1onLShrjU/fKNUvHfFd8U8k58a3DhlQ/CNZEFoVRT8YOGNWpnyy0Y6X
         Z7L9/6jpf5WYVSZqmYnqogWRVv5CuNGqEvZDD9u8U/s/abRcBlMnJ6ZQSQyrzywOxI60
         LBcVv21RVz24qLVWyLnzG2Kw9pNcYqvROunqw7XoDgZm/kja0HYqKQL+XndqShNwnrKh
         VF4ShE8RkvUHspIP3pZORAjH6DclSeHXSFG7O5jpUqnbnoBhuX/6N0upgMNC09dsCeFd
         Z3VPQl2fyw7GmZtvzS6FWjv/JwPxyhRXcF5WYpRBvy34GNyCuzHJGxERXUK8PEvwb3t7
         mYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj8x1b5UrFoiDWmvGVSED4849/E7CnYkD1cMQGqDKT7oXCMBvSLQhVFY0qqslUIiE62aZOCCpSJls=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDqI/Ua1AttBRnMP7uKfmmj0aPHdaOIqg+Vkbd8DGtBKH58Uww
	7D/JWHr45WcDPDWjlBPU1UTxoradQX1umn7WBs8/Mjtpt5l5PQ6E3jpi
X-Gm-Gg: ASbGncuiAyu3YPTcv9TJ/okM0qQMHqfETMn+WVKOt/s6RDpQCA0tARzirIZKrswZfAo
	vaoKC7bqVpshT1zK/d1KucM8Umo4lPNHTtFeKQdIafh0rVvbHNzF/skmzoklgUKKQzBPk8Dm5Pc
	wTxl/5WZ8ubUCflwpZ/RcyuGU1CRZrO6aigRa8QjFnVSnGgWdIPziSuCu6Gr5fGpppak5/64dKv
	0HAZ527oSakiVLQHcNa8KQ3NAaFVo4FEI83HA6ChWV77F6LPTVN/YGqICVdWp6ozsCtu2ULVEQJ
	I2FYUtFCHn6p905R37npFHfUSZawMJbSYGKNemoQEyQXnbZn717OZf1neejl22K7Q6E8J19d5mq
	jOB9prfmeACaLR4UxTG7GzpqlsLkIADJT
X-Google-Smtp-Source: AGHT+IHZlFODryvhCu0CCG3gt/BlBaQ8kwhswBlExrCAJNPYed+bNEQkB+8BqmYf3YVynM8ofoZtGQ==
X-Received: by 2002:a05:6000:2910:b0:3ee:1296:d9e6 with SMTP id ffacd0b85a97d-40e4a70cd17mr530669f8f.61.1758731674953;
        Wed, 24 Sep 2025 09:34:34 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf53cesm30967913f8f.59.2025.09.24.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:34:34 -0700 (PDT)
Message-ID: <9c4bffd48ae568c568352d9a8412531915ff2119.camel@gmail.com>
Subject: Re: [PATCH] i3c: fix big-endian FIFO transfers
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Jorge Marques
 <jorge.marques@analog.com>, Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Manikanta Guntupalli
	 <manikanta.guntupalli@amd.com>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 24 Sep 2025 17:35:02 +0100
In-Reply-To: <20250924150303.3601429-1-arnd@kernel.org>
References: <20250924150303.3601429-1-arnd@kernel.org>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_093437_570620_90567DCF 
X-CRM114-Status: GOOD (  21.76  )
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

T24gV2VkLCAyMDI1LTA5LTI0IGF0IDE3OjAyICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gU2hvcnQgTU1JTyB0cmFu
c2ZlcnMgdGhhdCBhcmUgbm90IGEgbXVsdGlwbGUgb2YgZm91ciBieXRlcyBpbiBzaXplIG5lZWQK
PiBhIHNwZWNpYWwgY2FzZSBmb3IgdGhlIGZpbmFsIGJ5dGVzLCBob3dldmVyIHRoZSBleGlzdGlu
ZyBpbXBsZW1lbnRhdGlvbgo+IGlzIG5vdCBlbmRpYW4tc2FmZSBhbmQgaW50cm9kdWNlcyBhbiBp
bmNvcnJlY3QgYnl0ZXN3YXAgb24gYmlnLWVuZGlhbgo+IGtlcm5lbHMuCj4gCj4gVGhpcyB1c3Vh
bGx5IGRvZXMgbm90IGNhdXNlIHByb2JsZW1zIGJlY2F1c2UgbW9zdCBzeXN0ZW1zIGFyZQo+IGxp
dHRsZS1lbmRpYW4gYW5kIG1vc3QgdHJhbnNmZXJzIGFyZSBtdWx0aXBsZSBvZiBmb3VyIGJ5dGVz
IGxvbmcsIGJ1dAo+IHN0aWxsIG5lZWRzIHRvIGJlIGZpeGVkIHRvIGF2b2lkIHRoZSBleHRyYSBi
eXRlc3dhcC4KPiAKPiBDaGFuZ2UgdGhlIHNwZWNpYWwgY2FzZSBmb3IgYm90aCBpM2Nfd3JpdGVs
X2ZpZm8oKSBhbmQgaTNjX3JlYWRsX2ZpZm8oKQo+IHRvIHVzZSBub24tYnl0ZXN3YXBwaW5nIHdy
aXRlc2woKSBhbmQgcmVhZHNsKCkgd2l0aCBhIHNpbmdsZSBlbGVtZW50Cj4gaW5zdGVhZCBvZiB0
aGUgYnl0ZXN3YXBwaW5nIHdyaXRlbCgpL3JlYWRsKCkgdGhhdCBhcmUgbWVhbnQgZm9yIGluZGl2
aWR1YWwKPiBNTUlPIHJlZ2lzdGVycy4KPiAKPiBUaGUgZWFybGllciB2ZXJzaW9ucyBpbiB0aGUg
ZHctaTNjIGFuZCBpM2MtbWFzdGVyLWNkbnMgaGFkIGEgY29ycmVjdAo+IGltcGxlbWVudGF0aW9u
LCBidXQgdGhlIGdlbmVyaWMgdmVyc2lvbiB0aGF0IHdhcyByZWNlbnRseSBhZGRlZCBicm9rZSBp
dC4KPiAKPiBGaXhlczogNzMzYjQzOTM3NWI0ICgiaTNjOiBtYXN0ZXI6IEFkZCBpbmxpbmUgaTNj
X3JlYWRsX2ZpZm8oKSBhbmQKPiBpM2Nfd3JpdGVsX2ZpZm8oKSIpCj4gQ2M6IE1hbmlrYW50YSBH
dW50dXBhbGxpIDxtYW5pa2FudGEuZ3VudHVwYWxsaUBhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gVGhpcyB3YXMgYSByZWNlbnQg
cmVncmVzc2lvbiwgdGhlIHZlcnNpb24gaW4gNi4xNiBzdGlsbCB3b3JrcywKPiBidXQgNi4xNy1y
YyBpcyBicm9rZW4uCj4gLS0tCj4gwqBkcml2ZXJzL2kzYy9pbnRlcm5hbHMuaCB8IDQgKystLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggYi9kcml2ZXJzL2kzYy9pbnRlcm5h
bHMuaAo+IGluZGV4IDBkODU3Y2M2OGNjNS4uMGY4YTI1Y2I3MWU3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL2ludGVybmFscy5oCj4gKysrIGIvZHJpdmVycy9pM2MvaW50ZXJuYWxzLmgKPiBA
QCAtMzgsNyArMzgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaTNjX3dyaXRlbF9maWZvKHZvaWQg
X19pb21lbSAqYWRkciwgY29uc3QKPiB2b2lkICpidWYsCj4gwqAJCXUzMiB0bXAgPSAwOwo+IMKg
Cj4gwqAJCW1lbWNweSgmdG1wLCBidWYgKyAobmJ5dGVzICYgfjMpLCBuYnl0ZXMgJiAzKTsKPiAt
CQl3cml0ZWwodG1wLCBhZGRyKTsKPiArCQl3cml0ZXNsKGFkZHIsICZidWYsIDEpOwoKRGlkbid0
IHlvdSBtZWFudCB3cml0ZXNsKGFkZHIsICZ0bXAsIDEpPwoKLSBOdW5vIFPDoQoKPiDCoAl9Cj4g
wqB9Cj4gwqAKPiBAQCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaTNjX3JlYWRs
X2ZpZm8oY29uc3Qgdm9pZCBfX2lvbWVtICphZGRyLAo+IHZvaWQgKmJ1ZiwKPiDCoAlpZiAobmJ5
dGVzICYgMykgewo+IMKgCQl1MzIgdG1wOwo+IMKgCj4gLQkJdG1wID0gcmVhZGwoYWRkcik7Cj4g
KwkJcmVhZHNsKGFkZHIsICZ0bXAsIDEpOwo+IMKgCQltZW1jcHkoYnVmICsgKG5ieXRlcyAmIH4z
KSwgJnRtcCwgbmJ5dGVzICYgMyk7Cj4gwqAJfQo+IMKgfQo+IC0tIAo+IDIuMzkuNQo+IAoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
