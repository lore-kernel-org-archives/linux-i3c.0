Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DEFC77B7E
	for <linux-i3c@archiver.kernel.org>; Sun, 30 Apr 2023 02:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8CYBrvR+8Jbxv6Q1Dv6P5FbY9Hoo7ASIsExMQcfHoI=; b=32oYXHVhwf4Vm6
	lQ4ilduHb6eAZjwYWNVJFrJAft3OKVsP0TXto1bPieFvXuI58bEvDfJto/kxpDPZ7NNKxps0Ri8B4
	qOe/oCA8NkzKmGie994WrCMudccul1prMcJk46CdtbFlQmd2ilKCqCWKhdqEbljCbMLao3v37YN/0
	1EHrdP5InrnxKvPhPb5yKpd7DSbEoJRAJNBhaigaspgM7bP2T5/0y14Iwrzlw8Gbw3k40ytWrCNib
	gAX1zb7zMFeXYa5GHHvzwmp3cW9+ZmMbP9DVg1ckcM8hqaqqIgjEZJsOmJV0FYqvjy05fZiJjr1yq
	y5BQM6yZVLGF7qGZNeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psx76-00DUhf-1E;
	Sun, 30 Apr 2023 02:48:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psx73-00DUgk-12
	for linux-i3c@lists.infradead.org;
	Sun, 30 Apr 2023 02:48:34 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4204A20033;
	Sun, 30 Apr 2023 10:48:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682822901;
	bh=zypWVf9MXS+lPQIzItTqVr7FILdJ9hERlQX46tPuHAQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NSLLVLm8VQGFuxD5PGQtL/WcVqx3tOl/CP/Jl7iQD0NlAb1TGdR/ax5AnNHXyFCd4
	 6je199kUjTKo2+uP99776iidHnguIDdLfHKuT0cXs0wSmOc9wtMmuvXAmfbZwDEAez
	 DHYuhJbXY2jZn0b3VsrucGOlZ9TGuwbIFb6gDm0hr/MMPgPJBXxEOAlNU723jEUNeF
	 hfhisf854oJ4wVb9YLvj/Xi0N6zwMSD9RWryEdcQ7JrPejipP1tyfjg+CjbT+RD+2p
	 Yb5YH3tL56d+TPtiCUP4pG+m3qBebrLel5KKljeay5cXWFry+mFU9c62idf3Mfscjh
	 +leRbFah41gbA==
Message-ID: <71e6b0d439cf53d9b8824370a52a5bed9ce4fcf9.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: ast2600: set variable ast2600_i3c_ops
 storage-class-specifier to static
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Tom Rix <trix@redhat.com>, alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 30 Apr 2023 10:48:19 +0800
In-Reply-To: <20230429134601.2688558-1-trix@redhat.com>
References: <20230429134601.2688558-1-trix@redhat.com>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_194833_590154_647F9E90 
X-CRM114-Status: UNSURE (   5.13  )
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

SGkgVG9tLAoKPiBzbWF0Y2ggcmVwb3J0cwo+IGRyaXZlcnMvaTNjL21hc3Rlci9hc3QyNjAwLWkz
Yy1tYXN0ZXIuYzoxMjE6MzQ6IHdhcm5pbmc6IHN5bWJvbAo+IMKgICdhc3QyNjAwX2kzY19vcHMn
IHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gCj4gVGhpcyB2YXJpYWJs
ZSBpcyBvbmx5IHVzZWQgaW4gaXRzIGRlZmluaW5nIGZpbGUsIHNvIGl0IHNob3VsZCBiZQo+IHN0
YXRpYy4KClN1cGVyLCB0aGFua3MhCgpSZXZpZXdlZC1ieTogSmVyZW15IEtlcnIgPGprQGNvZGVj
b25zdHJ1Y3QuY29tLmF1PgoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
