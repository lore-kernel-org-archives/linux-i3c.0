Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1252C021AA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o2ICaP+9o7y5JekJ08QbFAotZXNXJSWtsDKa+mV/gM=; b=wzSK0nQ8uqku3P
	spsFrV1uSQMKTmyZvSNQKGe1DiGeU2yEGUBhfat5clhmvtrg7wVLnwC09YzTQX9up2O4CksbvBHms
	C6yV25eis2e8XrrKWguXo5Zqv9YkP1MminIDEsxgDxHQeeG4NA4VMmfXRnIcquXGK2FZ4fG2sVJN3
	8Ah6IRdP6Wh+3N4/7Nhxm+tJt9kIYsY5HxT/2dnRmyv9PhF1AF89KSVPfZmAcFp9VfTCP8WZsyWYH
	ffCiVoNRSW3BFiazFpuYGdoW9Ewaf3I3cdVpp4+RFvuvWrJwkx8Ni1uErB+svBiUWbf8Vg3J6VUog
	pexyfvv0YXTAx1f/4mOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfn1-0000000BdzV-2FB5;
	Wed, 19 Feb 2025 08:50:43 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfRZ-0000000BWNa-1zs1
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 08:28:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6A044393;
	Wed, 19 Feb 2025 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739953710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exKoqztBJoJJiNjFsPWiUWzpl1Jwkr5h8NxnGYc9qcg=;
	b=mceIH92eWx935FtkZYGngBr3Sd9Kn6rluybk3eZjvC55G6HLhZNH9QR6uc4wXf+Piy63CZ
	S3lUchkYCk2CEBNwFpp9eQK8BrUe/xQ1/41KfQJ/rJ2INySRQVdjBBYkz2GQHLezCJqMuW
	b/rv3kkaFCabaNUwyx1T+kEi0nChQTzn77gDQpBjQw25qbG7bFlU3Qvj3PyV2DNLcG3tu0
	qNXlgfkc2nG2+Fym8nmG/5A1e1w7G+4W8R3nbSn3b96HbiMRD6LSXSMjfydYUFijsbjMcO
	xhJjALsbrfj5Tqz/5mVXqrQkjwK2uxtojYzA+g3j8kmSIU/21cxnZvbXXuj8YQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: frank.li@nxp.com,  alexandre.belloni@bootlin.com,
  linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
  tomer.maimon@nuvoton.com,  kwliu@nuvoton.com,  yschu@nuvoton.com
Subject: Re: [PATCH v1 2/3] i3c: master: svc: fix npcm845 FIFO empty issue
In-Reply-To: <20250219011019.1600058-3-yschu@nuvoton.com> (Stanley Chu's
	message of "Wed, 19 Feb 2025 09:10:18 +0800")
References: <20250219011019.1600058-1-yschu@nuvoton.com>
	<20250219011019.1600058-3-yschu@nuvoton.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Feb 2025 09:28:28 +0100
Message-ID: <87wmdmqqxf.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifeejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepshhtrghnlhgvhidrtghhuhihshesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehtohhmvghrrdhmrghimhhonhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehkfihlihhusehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohephihstghhuhesnhhuvhhothhonhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_002833_665080_74BB0CBB 
X-CRM114-Status: GOOD (  11.98  )
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

SGVsbG8gU3RhbmxleSwKCk9uIDE5LzAyLzIwMjUgYXQgMDk6MTA6MTggKzA4LCBTdGFubGV5IENo
dSA8c3RhbmxleS5jaHV5c0BnbWFpbC5jb20+IHdyb3RlOgoKPiBucGNtODQ1IEhXIGlzc3VlOgo+
IEkzQyBIVyBzdGFsbHMgdGhlIHdyaXRlIHRyYW5zZmVyIGlmIHRoZSB0cmFuc21pdCBGSUZPIGJl
Y29tZXMgZW1wdHksCj4gd2hlbiBuZXcgZGF0YSBpcyB3cml0dGVuIHRvIEZJRk8sIEkzQyBIVyBy
ZXN1bWVzIHRoZSB0cmFuc2ZlciBidXQKPiB0aGUgZmlyc3QgdHJhbnNtaXR0ZWQgZGF0YSBiaXQg
bWF5IGhhdmUgdGhlIHdyb25nIHZhbHVlLgo+IFdvcmthcm91bmQ6Cj4gRmlsbCB0aGUgRklGTyBp
biBhZHZhbmNlIHRvIHByZXZlbnQgRklGTyBmcm9tIGJlY29taW5nIGVtcHR5Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90b24uY29tPgo+IC0tLQoKLi4uCgo+IEBA
IC04OTEsNiArOTAzLDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2Vk
KHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLAo+ICAJdW5zaWduZWQgaW50IGRldl9uYiA9
IDAsIGxhc3RfYWRkciA9IDA7Cj4gIAl1MzIgcmVnOwo+ICAJaW50IHJldCwgaTsKPiArCXUzMiBk
eW5fYWRkcjsKPiAgCj4gIAl3aGlsZSAodHJ1ZSkgewo+ICAJCS8qIGNsZWFuIFNWQ19JM0NfTUlO
VF9JQklXT04gdzFjIGJpdHMgKi8KPiBAQCAtOTMxLDYgKzk0NCwxNSBAQCBzdGF0aWMgaW50IHN2
Y19pM2NfbWFzdGVyX2RvX2RhYV9sb2NrZWQoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIs
Cj4gIAkJaWYgKFNWQ19JM0NfTVNUQVRVU19SWFBFTkQocmVnKSkgewo+ICAJCQl1OCBkYXRhWzZd
Owo+ICAKPiArCQkJLyoKPiArCQkJICogU1ZDX0kzQ19RVUlSS19GSUZPX0VNUFRZIGZpeDoKPiAr
CQkJICogVGhlIFRYIEZJRk8gc2hvdWxkIGJlIHJlYWR5IGJlZm9yZSB0aGUgVFggdHJhbnNtaXNz
aW9uIGlzIHN0YXJ0aW5nLgo+ICsJCQkgKi8KPiArCQkJZHluX2FkZHIgPSBpM2NfbWFzdGVyX2dl
dF9mcmVlX2FkZHIoJm1hc3Rlci0+YmFzZSwgbGFzdF9hZGRyICsgMSk7Cj4gKwkJCWlmIChkeW5f
YWRkciA8IDApCj4gKwkJCQlyZXR1cm4gZHluX2FkZHI7Cj4gKwkJCXdyaXRlbChkeW5fYWRkciwg
bWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19NV0RBVEFCKTsKCk1heWJlIEZyYW5rIGNhbiB0ZXN0LCBi
dXQgaXQgZmVlbHMgbGlrZSB0aGVyZSBhcmUgY2hhbmNlcyBpdCB3aWxsIGJyZWFrCnRoZSBvdGhl
ciBjb250cm9sbGVyLgoKUGVyaGFwcyB0aGUgb3RoZXIgcXVpcmsgYXBwbGllcyB0byB0aGUgb3Ro
ZXIgY29udHJvbGxlciB0aG91Z2guCgoKUmVnYXJkaW5nIHlvdXIgc2VyaWVzLCBwYXRjaCAxIGRv
ZXMgbm90IG1ha2UgbXVjaCBzZW5zZSBhbG9uZSwgYW5kIHlvdQpzaG91bGQgYW55d2F5IHdyaXRl
IGEgYmluZGluZyBwYXRjaCBmb3IgeW91ciBuZXcgY29tcGF0aWJsZSAoZmlyc3QgaW4KdGhlIHNl
cmllcykuCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
