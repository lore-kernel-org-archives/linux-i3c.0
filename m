Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793DFCDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJBDh3JGa3L0f6tiBHGd4sAa6nR873luEqbp6pfoilo=; b=U/EhHAzD5Rtrrx
	XIUP9FrYQO04jHrx8ZRvhiw1EoI5hijoW/+PBCvFOI+NeEM13LLyFAVY6Pp7SA+rwEXy3Y+Jy8zcf
	uco/bp2ynY4YE+xUrZFZwjbvulCeQMO0FofBPyknu6+NxIMMhTYAF8hu27+Mr9wRW0Li6H/ewg3+u
	S8AqVCjXu///V3Z0GnXnaeECRSELY9a+6Rqzw/sXWSQy49HQ+kmcslkZRJyJ6GbDXD50BrOADo8Ia
	yJvT7NN55MOMOJjDADFPAHioBysJByNLMIjdTWgFt0OeX7tS1hNhNSflmoGiBMMJWQMupGa9p6325
	VkYgnDV7D5fJnMNYRc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlIE-001bzv-2X;
	Fri, 20 Oct 2023 08:55:42 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlIC-001byn-00
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 08:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697792139; x=1729328139;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ldKD9vWG59M8ubPGySLlaVJYtWih/t+41frfCeRocik=;
  b=ikbjTgOn+x92L5Hl4mtnHmoOinzcLo+l7Rh08Cb0ZmdJL8AL1mwYOiuK
   lDUIy70bv6JKMrvjAqUcXsohROjEOUxLY0DVqTR1ZoxPUpdASXw5TvQCC
   hnbOfvjGonvMM5ED6YAiRfodX/fsMt6pqsi/RAFj59iG2YcgjmuOhLwmd
   e2B9rY0RLBIG3oGkoYXyBsxHBe4+2+AsxLI+QQ6fQKPnrdaKE3F1LUhdV
   5NWaGKxcCo2ABvt5QJnJ9Wz/Zb2abK0JbG+gQsDARpv6aJouYiXfmtM58
   L7F5eKSCeBu3Rwed5hGfmMJWTtZFhoQrChx/zg/AtAp3VuTOYXgcTSbjQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366690152"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366690152"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750855353"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="750855353"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:55:32 -0700
Received: from [10.252.61.130] (zlukwins-mobl.ger.corp.intel.com [10.252.61.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2B53C580BE3;
	Fri, 20 Oct 2023 01:55:29 -0700 (PDT)
Message-ID: <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
Date: Fri, 20 Oct 2023 10:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <20231018205929.3435110-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_015540_050205_A30FA9F5 
X-CRM114-Status: GOOD (  22.21  )
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

T24gMTAvMTgvMjAyMyAxMDo1OSBQTSwgRnJhbmsgTGkgd3JvdGU6Cj4gQWRkIGhvdGpvaW4gZW50
cnkgaW4gc3lzIGZpbGUgc3lzdGVtIGFsbG93IHVzZXIgZW5hYmxlL2Rpc2FibGUgaG90am9pbgo+
IGZlYXR1cmUuCj4KPiBBZGQgKCplbmFibGUoZGlzYWJsZSlfaG90am9pbikoKSB0byBpM2NfbWFz
dGVyX2NvbnRyb2xsZXJfb3BzLgo+IEFkZCBhcGkgaTNjX21hc3Rlcl9lbmFibGUoZGlzYWJsZSlf
aG90am9pbigpOwoKV2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIGhhdmluZyBISiBlbmFibGUga25v
YiBpbiBzeXNmcyBhdmFpbGFibGUgZm9yIAp1c2VyIHNwYWNlIG90aGVyIHRoYW4gZm9yIGRlYnVn
IHN0dWZmPyBJbiBvdGhlciB3b3JkcywgZG9lcyB1c2VyIHNwYWNlIApyZWFsbHkgbmVlZCB0byBl
bmFibGUvZGlzYWJsZSBISiBpbiBydW50aW1lIGZvciBvdGhlciByZWFzb24gYnV0IGRlYnVnPyAK
SWYgaXQgaXMgb25seSBmb3IgZGVidWcgbWF5YmUgaXTCoCBjb3VsZCBiZSBtb3ZlIHRvIGRlYnVn
RlM/CgpJIHRoaW5rIHRoYXQgbWF5YmUgSEogZW5hYmxlIGtub2Igc2hhbGwgYmUgYXZhaWxhYmxl
IGluIERUIHNvIHlvdSBjb3VsZCAKY29udHJvbCB0aGUgZGVmYXVsdCBzdGF0ZSBmb3IgdGhpcyBm
ZWF0dXJlIGFsc28gYXQgY29tcGlsYXRpb24gcGhhc2U/Cgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9pM2MvbWFzdGVyLmMgICAg
ICAgfCA4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgaW5jbHVk
ZS9saW51eC9pM2MvbWFzdGVyLmggfCAgNSArKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgODkgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVy
cy9pM2MvbWFzdGVyLmMKPiBpbmRleCAwOGFlYjY5YTc4MDAzLi5lZDVlMjdjZDIwODExIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiBAQCAtNTI2LDYgKzUyNiw4OSBAQCBzdGF0aWMgc3NpemVfdCBpMmNfc2NsX2ZyZXF1ZW5j
eV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIH0KPiAgIHN0YXRpYyBERVZJQ0VfQVRUUl9S
TyhpMmNfc2NsX2ZyZXF1ZW5jeSk7Cj4gICAKPiArc3RhdGljIGludCBpM2Nfc2V0X2hvdGpvaW4o
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLCBib29sIGVuYWJsZSkKPiArewo+
ICsJaW50IHJldDsKPiArCj4gKwlpZiAoIW1hc3RlciB8fAo+ICsJICAgICFtYXN0ZXItPm9wcyB8
fAo+ICsJICAgICFtYXN0ZXItPm9wcy0+ZW5hYmxlX2hvdGpvaW4gfHwKPiArCSAgICAhbWFzdGVy
LT5vcHMtPmRpc2FibGVfaG90am9pbgo+ICsJICAgKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsK
PiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soJm1hc3Rlci0+YnVzKTsKPiArCj4gKwlpZiAoZW5h
YmxlKQo+ICsJCXJldCA9IG1hc3Rlci0+b3BzLT5lbmFibGVfaG90am9pbihtYXN0ZXIpOwo+ICsJ
ZWxzZQo+ICsJCXJldCA9IG1hc3Rlci0+b3BzLT5kaXNhYmxlX2hvdGpvaW4obWFzdGVyKTsKPiAr
Cj4gKwltYXN0ZXItPmhvdGpvaW4gPSBlbmFibGU7Cj4gKwo+ICsJaTNjX2J1c19ub3JtYWx1c2Vf
dW5sb2NrKCZtYXN0ZXItPmJ1cyk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiArc3Rh
dGljIHNzaXplX3QgaG90am9pbl9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2VfYXR0cmlidXRlICphdHRyLAo+ICsJCQkgICAgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGNv
dW50KQo+ICt7Cj4gKwlzdHJ1Y3QgaTNjX2J1cyAqaTNjYnVzID0gZGV2X3RvX2kzY2J1cyhkZXYp
Owo+ICsJaW50IHJldDsKPiArCWxvbmcgcmVzOwo+ICsKPiArCWlmICghaTNjYnVzLT5jdXJfbWFz
dGVyKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmIChrc3RydG9sKGJ1ZiwgMTAsICZy
ZXMpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXJldCA9IGkzY19zZXRfaG90am9pbihp
M2NidXMtPmN1cl9tYXN0ZXItPmNvbW1vbi5tYXN0ZXIsICEhcmVzKTsKPiArCWlmIChyZXQpCj4g
KwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXR1cm4gY291bnQ7Cj4gK30KPiArCj4gKy8qCj4gKyAq
IGkzY19tYXN0ZXJfZW5hYmxlX2hvdGpvaW4gLSBFbmFibGUgaG90am9pbgo+ICsgKiBAbWFzdGVy
OiBJM0MgbWFzdGVyIG9iamVjdAo+ICsgKgo+ICsgKiBSZXR1cm46IGEgMCBpbiBjYXNlIG9mIHN1
Y2Nlc3MsIGFuIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+ICsgKi8KPiAraW50IGkz
Y19tYXN0ZXJfZW5hYmxlX2hvdGpvaW4oc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFz
dGVyKQo+ICt7Cj4gKwlyZXR1cm4gaTNjX3NldF9ob3Rqb2luKG1hc3RlciwgdHJ1ZSk7Cj4gK30K
PiArRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9lbmFibGVfaG90am9pbik7Cj4gKwo+ICsv
Kgo+ICsgKiBpM2NfbWFzdGVyX2Rpc2FibGVfaG90am9pbiAtIERpc2FibGUgaG90am9pbgo+ICsg
KiBAbWFzdGVyOiBJM0MgbWFzdGVyIG9iamVjdAo+ICsgKgo+ICsgKiBSZXR1cm46IGEgMCBpbiBj
YXNlIG9mIHN1Y2Nlc3MsIGFuIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+ICsgKi8K
PiAraW50IGkzY19tYXN0ZXJfZGlzYWJsZV9ob3Rqb2luKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlcikKPiArewo+ICsJcmV0dXJuIGkzY19zZXRfaG90am9pbihtYXN0ZXIsIGZh
bHNlKTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfbWFzdGVyX2Rpc2FibGVfaG90am9p
bik7Cj4gKwo+ICtzdGF0aWMgc3NpemVfdCBob3Rqb2luX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqZGEsIGNoYXIgKmJ1ZikKPiArewo+ICsJc3RydWN0
IGkzY19idXMgKmkzY2J1cyA9IGRldl90b19pM2NidXMoZGV2KTsKPiArCXNzaXplX3QgcmV0Owo+
ICsKPiArCWkzY19idXNfbm9ybWFsdXNlX2xvY2soaTNjYnVzKTsKPiArCXJldCA9IHN5c2ZzX2Vt
aXQoYnVmLCAiJWRcbiIsIGkzY2J1cy0+Y3VyX21hc3Rlci0+Y29tbW9uLm1hc3Rlci0+aG90am9p
bik7Cj4gKwlpM2NfYnVzX25vcm1hbHVzZV91bmxvY2soaTNjYnVzKTsKPiArCj4gKwlyZXR1cm4g
cmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcoaG90am9pbik7Cj4gKwo+ICAg
c3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmkzY19tYXN0ZXJkZXZfYXR0cnNbXSA9IHsKPiAgIAkm
ZGV2X2F0dHJfbW9kZS5hdHRyLAo+ICAgCSZkZXZfYXR0cl9jdXJyZW50X21hc3Rlci5hdHRyLAo+
IEBAIC01MzYsNiArNjE5LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmkzY19tYXN0ZXJk
ZXZfYXR0cnNbXSA9IHsKPiAgIAkmZGV2X2F0dHJfcGlkLmF0dHIsCj4gICAJJmRldl9hdHRyX2R5
bmFtaWNfYWRkcmVzcy5hdHRyLAo+ICAgCSZkZXZfYXR0cl9oZHJjYXAuYXR0ciwKPiArCSZkZXZf
YXR0cl9ob3Rqb2luLmF0dHIsCj4gICAJTlVMTCwKPiAgIH07Cj4gICBBVFRSSUJVVEVfR1JPVVBT
KGkzY19tYXN0ZXJkZXYpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIu
aCBiL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gaW5kZXggMGI1MmRhNGYyMzQ2Ny4uNjVi
ODk2NTk2OGFmMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gQEAgLTQ1Miw2ICs0NTIsOCBAQCBzdHJ1
Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyX29wcyB7Cj4gICAJaW50ICgqZGlzYWJsZV9pYmkpKHN0
cnVjdCBpM2NfZGV2X2Rlc2MgKmRldik7Cj4gICAJdm9pZCAoKnJlY3ljbGVfaWJpX3Nsb3QpKHN0
cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiAgIAkJCQkgc3RydWN0IGkzY19pYmlfc2xvdCAqc2xv
dCk7Cj4gKwlpbnQgKCplbmFibGVfaG90am9pbikoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxl
ciAqbWFzdGVyKTsKPiArCWludCAoKmRpc2FibGVfaG90am9pbikoc3RydWN0IGkzY19tYXN0ZXJf
Y29udHJvbGxlciAqbWFzdGVyKTsKPiAgIH07Cj4gICAKPiAgIC8qKgo+IEBAIC00ODcsNiArNDg5
LDcgQEAgc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciB7Cj4gICAJY29uc3Qgc3RydWN0IGkz
Y19tYXN0ZXJfY29udHJvbGxlcl9vcHMgKm9wczsKPiAgIAl1bnNpZ25lZCBpbnQgc2Vjb25kYXJ5
IDogMTsKPiAgIAl1bnNpZ25lZCBpbnQgaW5pdF9kb25lIDogMTsKPiArCXVuc2lnbmVkIGludCBo
b3Rqb2luOiAxOwo+ICAgCXN0cnVjdCB7Cj4gICAJCXN0cnVjdCBsaXN0X2hlYWQgaTNjOwo+ICAg
CQlzdHJ1Y3QgbGlzdF9oZWFkIGkyYzsKPiBAQCAtNTQzLDYgKzU0Niw4IEBAIGludCBpM2NfbWFz
dGVyX3JlZ2lzdGVyKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiAgIAkJ
CWNvbnN0IHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzICpvcHMsCj4gICAJCQlib29s
IHNlY29uZGFyeSk7Cj4gICB2b2lkIGkzY19tYXN0ZXJfdW5yZWdpc3RlcihzdHJ1Y3QgaTNjX21h
c3Rlcl9jb250cm9sbGVyICptYXN0ZXIpOwo+ICtpbnQgaTNjX21hc3Rlcl9lbmFibGVfaG90am9p
bihzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpOwo+ICtpbnQgaTNjX21hc3Rl
cl9kaXNhYmxlX2hvdGpvaW4oc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKTsK
PiAgIAo+ICAgLyoqCj4gICAgKiBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YSgpIC0gZ2V0IG1hc3Rl
ciBwcml2YXRlIGRhdGEgYXR0YWNoZWQgdG8gYW4gSTNDCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
