Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDE0C7619A
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq+oQd2IJVP2QyWnO6o9fI33GKpOhdu4mRzumIZqcSE=; b=HNS/HZA/Hb4K1x
	fC0Md3/6b4aaBdSDBIECiigrvBYfX8KekTGoFbxnGTVKgCqQzFtN0CiCPdBsP7knMXn6g7T8pMOwN
	j0zSb82dGMmAhT3F8jkwTa13OIZ9EtXpfnFq4wElD4h8LTg8RRSyU+g0v+YbDeVe8cSeB1VtsyMo3
	YOEcdUD4iwrSW53T72z5Xnnc2DxVTRZ8rLWCn496hKp8DfpInfaytrjdjS2rYx2HPO0CTtFMOtJ/O
	afbTK/XrNyzXo6Q0knCro3Ac4Cl0L8Ky6uoG1XzjLHUaKLEQrllwnj+cfrFMO+L9YFEHdii0xjHXz
	sqwi/AKEg/LU05vL+dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi4JF-005bhY-1G;
	Fri, 31 Mar 2023 02:16:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi4JC-005bh6-11
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 02:16:07 +0000
Received: from [192.168.191.192] (pa49-196-168-189.pa.vic.optusnet.com.au [49.196.168.189])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A2038200DB;
	Fri, 31 Mar 2023 10:16:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680228963;
	bh=GNH1mUoYLhaZFv4OsnOAcvZgBheSprpixRmNk8rCH2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TP6Ed4BmmPoEDaysA1/yL60jcfNDKgR/hUPINCzRjJQsBKAnmLfnIT3sGT+DZHsAx
	 44GxraVBJoUMEcAN0bH8QoRTZ+sFCYogCqaI9M1csx0FJeshayOwKdn8PKmfQqG6RB
	 J/flTeAB39zpXbTJ6vUvfUFi1v9/52uHjzsBQOYi4ov07G/V/gukcuB5kzpmzNS3Py
	 aIML5CdIYoPTCvWNDm+ZyQ5BetRAzhgcbgjWT1w/miOZJJIVRphxPbRS9JjPmvenQW
	 j2H+XI+/wSSkcSNRscH80zRsxxoh7CgFKpCRXbgypKinUqGrCb2vqRP2DKsuqDeqMH
	 2Hn4m3WrkWawg==
Message-ID: <84d0caac03c6ca8d0c3ee282dbee1c55500c50ab.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/5] i3c: dw: Create a generic fifo read function
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ben Dooks <ben.dooks@sifive.com>, linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>, Vitor Soares
 <ivitro@gmail.com>,  Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Chen <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 31 Mar 2023 10:16:01 +0800
In-Reply-To: <1981d2b2-8082-ccba-5a41-7f2162410163@sifive.com>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
	 <827204789583dd86addffb47ecaeab9d67cf95d5.1680161823.git.jk@codeconstruct.com.au>
	 <1981d2b2-8082-ccba-5a41-7f2162410163@sifive.com>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_191606_549217_5F00A42C 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
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

SGkgQmVuLAoKPiA+ICtzdGF0aWMgdm9pZCBkd19pM2NfbWFzdGVyX3JlYWRfcnhfZmlmbyhzdHJ1
Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4ICpieXRl
cywgaW50IG5ieXRlcykKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZHdfaTNjX21h
c3Rlcl9yZWFkX2ZpZm8obWFzdGVyLCBSWF9UWF9EQVRBX1BPUlQsIGJ5dGVzLCBuYnl0ZXMpOwo+
ID4gK30KPiA+ICsKPiAKPiBNaWdodCB3YW50IHRvIG1ha2UgaXQgaW5saW5lIHRvby4KClRoZSBj
b21waWxlciB3aWxsIGFsbW9zdCBjZXJ0YWlubHkgd29yayB0aGF0IG91dDoKCiAgICAkIGFybS1s
aW51eC1nbnVlYWJpaGYtb2JqZHVtcCAtdCBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rl
ci5vIHwgZ3JlcCBmaWZvCiAgICAwMDAwMGI3NCBsICAgICBGIC50ZXh0CTAwMDAwMGE0IGR3X2kz
Y19tYXN0ZXJfcmVhZF9maWZvCgotIGFuZCBJJ2QgcHJlZmVyIHRvIG5vdCBvdmVycmlkZSBhbnkg
Y29tcGlsZXIgZGVjaXNpb24gbm90IHRvIGlubGluZSwgaWYKdGhhdCB3b3JrcyBvdXQgYmV0dGVy
IGluIHNwZWNpZmljIGNpcmN1bXN0YW5jZXMgb3Igd2l0aCBhbnkgZnV0dXJlCmNoYW5nZXMuCgpD
aGVlcnMsCgoKSmVyZW15CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
