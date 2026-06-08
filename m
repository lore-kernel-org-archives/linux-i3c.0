Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49216CD8C8E
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BElP+zp8J6ZnOu5TJl9tQ3N+9Csx4RB6h/vtUGUeVXc=; b=hnZ5BY8CljK3ya
	YeoNU/t4+unybXS/sjWU1eWAHmfyxZyFXX82qlFvbxEj2Iout/h3q4dAXuGkiFMxo/Rc5vh6Gl2KL
	eoSNKOjGD9bqub+EO1IGTvMlyIzngQsv2WNu7MyVj1d8hxhZ5lHGASEZ6qYrYK2Rmu+1WkYEz4s4w
	VLYG0R+ExAi27rpFysKhpUvZR2SL+hV0x/feQrn/ShnBiVtbTbSkLinL6gzDLzgH445bmFFVZIANS
	P1gNb/GkuXhlT5X6m1bZdeuPu60LiAgDPyDCuM6e4LuvtXFigoTIFlbcXWAIvzSXeEfCcIGSe83Y4
	z1qY9GfPpOX+7vNCB8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsQ-000000031Sr-30ul;
	Mon, 08 Jun 2026 07:58:30 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUsO-000000031Rq-0W96
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 07:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780905509; x=1812441509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KvsnUxNlENe/8t68Aly3yDXUNfe5o9kjNbO4x0qNTAs=;
  b=ZS7K47ng9nz5scqbCHXnQIyfoZ1zmavf0absYATMCW8owYpDNDF7AEt9
   0p4PpvIVhz315Dmxesb+hnAqnZeZvWcudhzHBhTc0W/9XUG/5SJmBJUcj
   qajG/wUdvdicT41jIrY4bGA1ffa3bUIZDNRcAq2S6G/DgxEfXesT/EKdO
   Ht50H+sdS+Tb2HKpsk/LLWTVKEFws76dA06j5jKmRoSgBT1ehZddVIj7V
   rB7TPu9yo8gFYFHmUUH8ugcVftzRFPLDEIamtScAb/D+Nf6G4gonY1q6S
   Bs11V6UsvqCekuFD7GSFGF6s5WrfSo42Rzfa44Ee9D5Yt9UxJXV5QtpfD
   g==;
X-CSE-ConnectionGUID: /u3Sc7tlQli7vG3xxZCM3Q==
X-CSE-MsgGUID: z/lBFt+8Q4WZMJ822wbirw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85520154"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85520154"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:28 -0700
X-CSE-ConnectionGUID: pYxwM8Z7TcqmVdiqPrZEWw==
X-CSE-MsgGUID: Bq3gfeTAQsaP7kKFmac7Ug==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:58:26 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/7] i3c: mipi-i3c-hci: Ignore DISEC failures when disabling IBIs
Date: Mon,  8 Jun 2026 10:57:55 +0300
Message-ID: <20260608075801.16111-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608075801.16111-1-adrian.hunter@intel.com>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_005828_240000_D84E11FE 
X-CRM114-Status: GOOD (  12.42  )
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

RGlzYWJsaW5nIElCSXMgY3VycmVudGx5IHJldHVybnMgdGhlIHJlc3VsdCBvZiB0aGUgRElTRUMg
Q0NDLCBjYXVzaW5nCmkzY19oY2lfZGlzYWJsZV9pYmkoKSB0byBmYWlsIGlmIHRoZSB0cmFuc2Zl
ciBlcnJvcnMgb3V0LgoKSG93ZXZlciwgdGhlIGNvbnRyb2xsZXIgaGFzIGFscmVhZHkgYmVlbiBw
cm9ncmFtbWVkIHRvIHJlamVjdCBJQklzIGJ5CnNldHRpbmcgREFUXzBfU0lSX1JFSkVDVCwgc28g
dGhlIHRhcmdldOKAmXMgSUJJcyBhcmUgZWZmZWN0aXZlbHkgZGlzYWJsZWQKZnJvbSB0aGUgaG9z
dCBzaWRlIHJlZ2FyZGxlc3Mgb2YgdGhlIG91dGNvbWUgb2YgdGhlIERJU0VDIGNvbW1hbmQuICBB
dAp0aGlzIHBvaW50LCB0ZWFyZG93biBvZiB0aGUgSUJJIGluZnJhc3RydWN0dXJlIGNhbiBzYWZl
bHkgcHJvY2VlZCBldmVuCmlmIERJU0VDIGZhaWxzLgoKTm90ZSwgZnJvbSB0aGVuIG9uLCB0aGUg
TUlQSSBJM0MgSENJIG5vdCBvbmx5IE5BQ0tzIHRoZSB0YXJnZXQncyBJQkkgYnV0CmF1dG9tYXRp
Y2FsbHkgc2VuZHMgYW5vdGhlciBESVNFQyBjb21tYW5kLgoKTWFrZSBpM2NfaGNpX2Rpc2FibGVf
aWJpKCkgcmVzaWxpZW50IGJ5IGlnbm9yaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YKaTNjX21hc3Rl
cl9kaXNlY19sb2NrZWQoKSBhbmQgYWx3YXlzIHJldHVybmluZyBzdWNjZXNzLgoKU2lnbmVkLW9m
Zi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Ci0tLQoKCkNoYW5n
ZXMgaW4gVjI6CgoJUmUtYmFzZSBkdWUgdG8gY2hhbmdlcyBpbiBwcmV2aW91cyBwYXRjaC4KCgog
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCA4ICsrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwppbmRleCAxZTFmMDVhZmYwOTIuLmZmZmJjMTc3NWVmOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKQEAgLTY5Nyw3ICs2OTcsMTMg
QEAgc3RhdGljIGludCBpM2NfaGNpX2Rpc2FibGVfaWJpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRl
dikKIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gdG9faTNjX2hjaShtKTsKIAogCV9faTNjX2hjaV9k
aXNhYmxlX2liaShoY2ksIGRldik7Ci0JcmV0dXJuIGkzY19tYXN0ZXJfZGlzZWNfbG9ja2VkKG0s
IGRldi0+aW5mby5keW5fYWRkciwgSTNDX0NDQ19FVkVOVF9TSVIpOworCS8qCisJICogVGhlIERB
VCBlbnRyeSBpcyBub3cgc2V0IHRvIE5BQ0sgYW5kIERJU0VDIHRoaXMgdGFyZ2V0J3MgSUJJcywg
c28KKwkgKiB0aGUgSUJJIHRlYXJkb3duIGNhbiBwcm9jZWVkIGV2ZW4gaWYgRElTRUMgYmVsb3cg
ZmFpbHMsIHNvIGlnbm9yZQorCSAqIGVycm9ycy4KKwkgKi8KKwlpM2NfbWFzdGVyX2Rpc2VjX2xv
Y2tlZChtLCBkZXYtPmluZm8uZHluX2FkZHIsIEkzQ19DQ0NfRVZFTlRfU0lSKTsKKwlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIHZvaWQgaTNjX2hjaV9yZWN5Y2xlX2liaV9zbG90KHN0cnVjdCBpM2Nf
ZGV2X2Rlc2MgKmRldiwKLS0gCjIuNTEuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
