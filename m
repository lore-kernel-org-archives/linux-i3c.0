Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6FDC55160
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Subject:CC:To:MIME-Version:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY8NCasPKyjxFg6Dsq++++7+2VApFJeYeqH8sNIeQFI=; b=kJgc2gXDUjxd4mYaWUn6v8ekcy
	aODJw1508tQqpo84UsflCbULsHHupMBJDwCqpepDjpKpKw9ZnbpkIeVKljXtIThDjasn2WNre3QiO
	jhMHSlOQcsWuDzmuUQ3dprlAnSXGw5iHG1BPtbajckCFiuWDDuEswigaSXzCxBk/P7sTzticNjBpd
	rrnQ8Y2edOLmsBY2ut1blFYENjVdxId9TIL8g07PRWG5o6Xni/AhJn6n9/bicuSOXp/g3kaMDwfM0
	PfAe7CCkK//lc+h7NM9kNI+t7P7L/m28crBpSu63TC8ZC4pNDHgb2hSat2+isITHyy88aDknEjN4O
	OAzLXkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGZk-00000009LzQ-3P9z;
	Thu, 30 Jul 2026 02:32:48 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGZh-00000009Lxe-3ph3
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 02:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=m/T0DHccDvJu8DEt5Dl6kUCV+jlFNpuQHUTsYJoQVhU=;
	b=AJEUkuASELeboJWDnvW9cnNpAaBreoL4qRUrRMUkO9OF5D+aJWh4GJbiStVx46
	P4tSiAi/6vmRJR7jm+POqjeZFkuoLxLLZF7r+jSMz50DQHByiWg0MLBZPbA0lFUU
	4PVz0bkOoWut4C+lM8Mr9QpXcPJ8BfzNDJOXLc33B5Ctc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgDnD3ymt2pqpKo1EA--.54817S2;
	Thu, 30 Jul 2026 10:32:06 +0800 (CST)
Message-ID: <6A6AB796.1040906@126.com>
Date: Thu, 30 Jul 2026 10:31:50 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, amergnat@baylibre.com, 
 tze.yee.ng@altera.com, adrian.ho.yin.ng@altera.com
CC: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix potential NULL dereference in send_ccc_cmd_locked
References: <20260728063045.73473-1-zenghongling@kylinos.cn> <5ac5f386-1b95-4b30-a7e2-c246c9bfad68@oss.qualcomm.com>
In-Reply-To: <5ac5f386-1b95-4b30-a7e2-c246c9bfad68@oss.qualcomm.com>
X-CM-TRANSID: QCkvCgDnD3ymt2pqpKo1EA--.54817S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyrtFyfGr48ArWxJF4kXrb_yoW8WrWfp3
	y8Ca10k348tFW8GF42qa13ZayYqwnIq3yrKF43X3ya9FWjyF1ktF1UWw1FvasrXFn5ArWY
	qryYqa1UuFZ0v37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8J5rUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrwdMHWpqt6fzLwAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_193246_337145_C02E2093 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDI25bm0MDfmnIgyOOaXpSAxODoyNywgTXVrZXNoIFNhdmFsaXlhIOWGmemBkzoKPgo+
Cj4gT24gNy8yOC8yMDI2IDEyOjAwIFBNLCBIb25nbGluZyBaZW5nIHdyb3RlOgo+PiBUaGUgcmV0
cnkgbG9vcCBhZGRlZCBpbiBjb21taXQgMDJjYzgzMjE5MWRkICgiaTNjOiBtYXN0ZXI6IFZhbGlk
YXRlIEdFVAo+PiAgIENDQyBwYXlsb2FkIGxlbmd0aCBhbmQgcmV0cnkgRGlyZWN0IEdFVCBvbmNl
IikgcmVzZXRzIHBheWxvYWQgCj4+IGFjdHVhbF9sZW4KPj4gYmVmb3JlIGVhY2ggYXR0ZW1wdC4g
SG93ZXZlciwgY21kLT5kZXN0cyBpcyBvbmx5IHZhbGlkYXRlZCBmb3IgRElSRUNUCj4+IENDQyBj
b21tYW5kcyAoSTNDX0NDQ19ESVJFQ1QgYml0IHNldCkuIEZvciBicm9hZGNhc3QgY29tbWFuZHMs
IGRlc3RzCj4+IGNhbiBiZSBOVUxMIHdoaWxlIG5kZXN0cyA+IDAsIGNhdXNpbmcgYSBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgYXQKPj4gY21kLT5kZXN0c1tpXS5wYXlsb2FkLmFjdHVhbF9sZW4u
Cj4+Cj4+IEZpeCBieSByZXN0cmljdGluZyB0aGUgYWN0dWFsX2xlbiByZXNldCB0byBESVJFQ1Qg
Y29tbWFuZHMuCj4+Cj4+IEZpeGVzOiAwMmNjODMyMTkxZGQgKCJpM2M6IG1hc3RlcjogVmFsaWRh
dGUgR0VUIENDQyBwYXlsb2FkIGxlbmd0aCAKPj4gYW5kIHJldHJ5IERpcmVjdCBHRVQgb25jZSIp
Cj4+IFNpZ25lZC1vZmYtYnk6IEhvbmdsaW5nIFplbmcgPHplbmdob25nbGluZ0BreWxpbm9zLmNu
Pgo+PiAtLS0KPj4gICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4gaW5kZXggZmQzZTc5
ZDEwYzg0Li4yMTIxMmMzNGMzMWUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5j
Cj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+IEBAIC0xMDUxLDcgKzEwNTEsNyBAQCBz
dGF0aWMgaW50IAo+PiBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQoc3RydWN0IGkzY19t
YXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+PiAgICAgICBmb3IgKGF0dGVtcHQgPSAwOyBhdHRl
bXB0IDwgbWF4X2F0dGVtcHRzOyBhdHRlbXB0KyspIHsKPj4gICAgICAgICAgIHVuc2lnbmVkIGlu
dCBpOwo+PiAgIC0gICAgICAgIGlmIChjbWQtPnJudykKPj4gKyAgICAgICAgaWYgKGNtZC0+cm53
ICYmIChjbWQtPmlkICYgSTNDX0NDQ19ESVJFQ1QpKQo+Cj4gUGxlYXNlIHJldmlldyB0aGlzIHJl
Y2VudCBmaXggQAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hbUphdTlMZ2VoWUxuUjIw
QGxpemhpLVByZWNpc2lvbi1Ub3dlci01ODEwLwo+CnwKCnxUaGFua3MsIEFkcmlhbidzIGZpeCBt
YWtlcyBtb3JlIHNlbnNlIGJ5IHZhbGlkYXRpbmcgdGhlIGlucHV0IGF0IHRoZQplbnRyeSBwb2lu
dCByYXRoZXIgdGhhbiBmaXhpbmcgb25seSB0aGUgcmV0cnkgbG9vcCB1c2Ugc2l0ZS58Cgp8Cj4+
ICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNtZC0+bmRlc3RzOyBpKyspCj4+ICAgICAg
ICAgICAgICAgICAgIGNtZC0+ZGVzdHNbaV0ucGF5bG9hZC5hY3R1YWxfbGVuID0gMDsKCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
