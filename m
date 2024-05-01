Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3BAC10F1A
	for <linux-i3c@archiver.kernel.org>; Wed,  1 May 2024 06:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A8qg+z6laRMjNRb8FHeAbMLdSqfY6OBl+h2S2vWyPA=; b=1GUs+cBE7Jq2dS
	uvjyj7lpGicmBE9KsTlaV1TIw7GiQNl59DBjIQRortij5yYfJpr3VtzNFOnMfAfg+xcT2Edei0w6a
	0ByLW9ssMFHC7jt40TQHm5vhDoNiW2RqIXRtBDzMU9WDtxq0tCRUzbMd+26xtKgoOPke7nJg9EhS4
	ebVoDwN07GOQXlD/ZE1c6JwJTmbHfbj2GEZyu0MA803zKYl7qvw3upbtgco0PLewfunQpmrYpZb8v
	7KziQsPbMQhgRnzkyHhaMT9vIejzBXvw+U6sMa04OaI3E6DpEgXPqPFV+4TPveu+tEnJK57CZ/CsB
	h0zVoH0IN+BjxF5LtkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s23ME-00000008gA4-0Ck1;
	Wed, 01 May 2024 06:22:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s23M6-00000008g93-1qw8
	for linux-i3c@lists.infradead.org;
	Wed, 01 May 2024 06:22:16 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DCC1520018;
	Wed,  1 May 2024 14:22:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714544526;
	bh=aZEukvDjPHUsfsMDddQjUUDFfLIVSPNH5W78XULOl1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lILSB58BXjGWAqdzHxIqtScR6qCeSg8PSYcSaU1oWUO9TdnLkWYMDu7nhOsXaIjw4
	 FGVe5qW+YKwQ2RvpJYU6j95dvFGbJSehVFKr5u9udwKR19EU/CQ/USueXXfpmZCgCs
	 cJ9SHU+IoMyVeyzVAs90b967bePXZvn7m+5KDsLmHkM7Cs54KhcTHhFeqE3MCPpJui
	 zVi+5QV15JUwZSSJIy9hiJIdSZKy0SF8S3FEV8sWMkKZP4csf9WooEi1yhG7bqJZEW
	 NnYp1Dgst7fc4Jg4OBE0YOtsjJYJUgg9xQTT2hUFPd67jIbIZGjow8/E7ePw1gA+J7
	 pIy7q0xTwE31g==
Message-ID: <563ad5613e9c5f0671e1f49f2d9ba71d8735799b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>, alexandre.belloni@bootlin.com, 
 joel@jms.id.au, u.kleine-koenig@pengutronix.de, gustavoars@kernel.org, 
 krzysztof.kozlowski@linaro.org, zenghuchen@google.com,
 matt@codeconstruct.com.au,  linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: BMC-SW@aspeedtech.com
Date: Wed, 01 May 2024 14:22:03 +0800
In-Reply-To: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
References: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_232214_698578_0B215418 
X-CRM114-Status: GOOD (  11.77  )
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

SGkgRHlsYW4sCgpKdXN0IGEgcXVlc3Rpb24gb24gYSBwcmlvciBwYXRjaCB5b3Ugc2VudDoKCj4g
RGlzYWJsZSBJQkkgSVJRIHNpZ25hbCBhbmQgc3RhdHVzIG9ubHkgd2hlbiBob3Qtam9pbiBhbmQg
U0lSIGVuYWJsaW5nCj4gb2YgYWxsIHRhcmdldCBkZXZpY2VzIGF0dGFjaGVkIHRvIHRoZSBidXMg
YXJlIGRpc2FibGVkLgo+IAo+IEZpeGVzOiBlMzg5YjFkNzJhNjIgKCJpM2M6IGR3OiBBZGQgc3Vw
cG9ydCBmb3IgaW4tYmFuZCBpbnRlcnJ1cHRzIikKClsuLi5dCgo+IC0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNj
LW1hc3Rlci5jCj4gQEAgLTExNjMsOCArMTE2MywxMCBAQCBzdGF0aWMgdm9pZCBkd19pM2NfbWFz
dGVyX3NldF9zaXJfZW5hYmxlZChzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ2xvYmFsID0gcmVnID09IDB4ZmZmZmZmZmY7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgJj0gfkJJVChpZHgpOwo+IMKgwqDC
oMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnbG9i
YWwgPSByZWcgPT0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm9vbCBoal9y
ZWplY3RlZCA9ICEhKHJlYWRsKG1hc3Rlci0+cmVncyArIERFVklDRV9DVFJMKSAmIERFVl9DVFJM
X0hPVF9KT0lOX05BQ0spOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
ZyB8PSBCSVQoaWR4KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ2xvYmFsID0g
KHJlZyA9PSAweGZmZmZmZmZmKSAmJiBoal9yZWplY3RlZDsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+
IMKgwqDCoMKgwqDCoMKgwqB3cml0ZWwocmVnLCBtYXN0ZXItPnJlZ3MgKyBJQklfU0lSX1JFUV9S
RUpFQ1QpOwo+IMKgCgpNeSBpbnRlcnByZXRhdGlvbiBvZiB0aGlzIGNoYW5nZSBpcyB0aGF0IHdl
IGtlZXAgdGhlICJnbG9iYWwiIElCSSBpcnEKZW5hYmxlZCBpZiBob3Qtam9pbi1uYWNrIGlzIHNl
dCAoaWUsIGFsd2F5cywgYmVjYXVzZSB3ZSBkb24ndCBzdXBwb3J0CmhvdCBqb2luLCBhbmQgY29u
ZmlndXJlIHRoZSBoYXJkd2FyZSB0byBuYWNrIGFsbCBob3Qgam9pbiByZXF1ZXN0cykuCgpIb3dl
dmVyLCB3ZSBuZXZlciBlbmFibGUgdGhlIGhvdC1qb2luIE5BQ0sgaW50ZXJydXB0IC0gSUJJX1FV
RVVFX0NUUkwKYml0IDAgaXMgbmV2ZXIgc2V0LiBTbyBJIGNhbid0IHNlZSBob3cgd2Ugd291bGQg
ZXZlciBnZXQgYW4gaW50ZXJydXB0CmZvciB0aGUgaG90IGpvaW4gTkFDSyBjYXNlIGFueXdheS4g
QmVjYXVzZSBvZiB0aGF0LCB0aGlzIHBhdGNoIGlzIGp1c3QKa2VlcGluZyB0aGUgSUJJIHRocmVz
aG9sZCBpbnRlcnJ1cHQgYWx3YXlzIGVuYWJsZWQgZm9yIG5vIHJlYXNvbi4KCk9yIGlzIHNvbWV0
aGluZyBlbHNlIGhhcHBlbmluZyBoZXJlPyBJcyB0aGVyZSBhbm90aGVyIGNhdXNlIGZvciB0aGUg
SUJJCnRocmVzaG9sZCBJUlFzPwoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
