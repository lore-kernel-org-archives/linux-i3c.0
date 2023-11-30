Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD0CC4167B
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VNamNmuJoIozWf97GAY75JMZn7QTzhvF5rTE8FUErA=; b=b2gLqdX3lX43Cu
	cFDgFVhdt/arURSsbbNeF/oI61TM0BXyi9HdL4keuDDOq2pyG3RZfFpy+34hCFKVag6p1wDemc32J
	/AHF5nTfe900pA9wx+Noej0IgqZ56JDbVUDL9uJx9lI8HlBL4hHhvyQBt7EBqw0xIJ/TY0a/fcZjU
	GHc8Zxcfao7enyW+t5D6yy55SlAcP8Ach86Wnta/9jEujFYJ5Bbv7DHzXqTBWj4J+WYYMTuuLOhyh
	Xn2PCgF+hdd1mjf98VdD4p4PTohkksKbdCSogCuXLIEhj6hoPda6/Ai02yOUuH4OpCXaq4CjJgy+F
	xyld0UXSVPbl1bOOnDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dzb-00AP8i-07;
	Thu, 30 Nov 2023 10:09:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dzY-00AP6n-0G
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 10:09:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B16DFF811;
	Thu, 30 Nov 2023 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701338991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvljltiRA/0ipo6rsSpOVOq9yCewhyizJDRIN7ESJBs=;
	b=g/PqJupxHoS1SgFzAvk3uFQbyqqgNVDpPtoLQ3pGuKRtRXheUyBKcIyIz5VdfM1hpCqvk2
	jiEd+xFGEwyOHydd6sZ4HZCxcb9uYWmOBaWUOsg19FGhpsXqPNZJ1llSNVJn6mfTb/2OsB
	k+XmKXlD+yBeZBoqYW2AoJEiNnoPAw1siqwsmzt/uudNfzgPZW5mnErETfgRv2zUpqlj48
	Jb+Pt398+IORIyHmR7pR3UueFE/QS9vrfPkvpBjFXgyLGy9VMQ9o+RsiUFDbsTVzctyD/K
	FLzTKbEWUlKSCXnfsTaLZb6iskZEN51WPSIqiByYh49zmH9goiul68e/FsWxcg==
Date: Thu, 30 Nov 2023 11:09:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 5/6] i3c: master: svc return actual transfer data len
Message-ID: <20231130110948.11a1ac71@xps-13>
In-Reply-To: <20231129221225.387952-6-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-6-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_020956_424519_7384D1FA 
X-CRM114-Status: UNSURE (   6.27  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTc6
MTI6MjQgLTA1MDA6Cgo+IEkzQyBhbGxvdyBkZXZpY2VzIGVhcmx5IHRlcm1pbmF0ZSBkYXRhIHRy
YW5zZmVyLiBTbyBzZXQgImFjdHVhbF9sZW4iIHRvCj4gaW5kaWNhdGUgaG93IG11Y2ggZGF0YSBn
ZXQgYnkgaTNjX3ByaXZfeGZlci4KClRoZSB0aXRsZSBwcmVmaXggc2hvdWxkIGJlIHRoZSBzYW1l
IGluIHRoZSB0d28gcGF0Y2hlcyBhZGRyZXNzaW5nIHRoZQpTVkMgZHJpdmVyLgoKV2l0aCB0aGlz
IGZpeGVkOgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+ClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
