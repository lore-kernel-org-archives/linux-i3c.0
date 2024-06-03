Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95C6C25B75
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Jun 2024 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxRIPfP1Kjk8IhuTCKgWQ00Jhhn8j1qvnnlPiuIzzGc=; b=LkWgNQVXBrRixo
	+PB7ktqXqEiBl58poy0OXHEjVlkcY2n/UPKCqpZl2S+eGzwRKAiKk+gsgwlcaTxT/PmsNnG5JqI85
	9UezjudV6jW2MT9KDCKkODv0aJsm3rjU76MwWaudAkmNdlGHjY+Hz+/cAQk1FXo8kWBvAP7WbnrFn
	mkhH2ClJNktgZ/NvbpR/7kuXE5nRoZAcSDzjXQJ0PoTcB5JRTSVTn2szqPYbf8r+1tZT7kLeS4C4R
	Vj0pbLDVZgIpwhWpNjq+7Egkl9MMw8WJAb6ueAjX4KvhZ804rZWbpfMEYb3SAB8rSLhbNfW+pst3s
	Pp+T96LV+ieykN/l1XfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9T8-0000000HDEB-0QnJ;
	Mon, 03 Jun 2024 15:19:30 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9T4-0000000HDCd-1scw
	for linux-i3c@lists.infradead.org;
	Mon, 03 Jun 2024 15:19:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD51720004;
	Mon,  3 Jun 2024 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717427963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIRjh/1emiNXMJXAEyC8Dl3UwXUntJPIvus2EcZ/RsI=;
	b=T8nkxOrvSFYQRPivRxw7V0hHYwWXyPBmBWQl4eQzx42OG3hdiCJG9oSpbbOeTZ9fH38l6C
	PM36RGn7PVI4L/oKdq1+o7ayd44NfXZEepfhNucDduLFGMPkPdgY9oCQekYxYQYJl3qXir
	7WDMBQT0/UchmpWkAcko4PxIKG/QjNMga1K8Q3PK3Ccz2F7C42kSs/vmkWT8e367U5ILBo
	5APTnQEpcOukQjV2BliwWuDV5aqmUsN2zgUirKo1PPffTDdYIIIWfBLtXPM4Qu3EPqIGy0
	X6nBl1Mgrjldox+bbLdfRPu9cpBnv5hAPMx/rOBOaFSPKs7aiGP6ZVA3JTRJhg==
Date: Mon, 3 Jun 2024 17:19:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: master: svc: fix IBIWON not set if IBI
 follow a hot join
Message-ID: <20240603171919.02c70327@xps-13>
In-Reply-To: <20240603151527.52235-1-Frank.Li@nxp.com>
References: <20240603151527.52235-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_081926_791133_ABC5ADA0 
X-CRM114-Status: UNSURE (   8.61  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgIDMgSnVuIDIwMjQgMTE6
MTU6MjYgLTA0MDA6Cgo+IFdoZW4gYW4gSW4tQmFuZCBJbnRlcnJ1cHQoSUJJKSBvY2N1cnMgYWZ0
ZXIgc3ZjX2kzY19tYXN0ZXJfZG9fZGFhX2xvY2tlZCgpLAo+IHR5cGljYWxseSB0cmlnZ2VyZWQg
ZHVyaW5nIGEgSG90IEpvaW4gKEhKKSBldmVudCwgdGhlIElCSVdPTiBmbGFnIGZhaWxzIHRvCj4g
YmUgc2V0IHdoZW4gaXNzdWluZyBhbiBhdXRvIElCSSBjb21tYW5kLgo+IAo+IFRoZSBpc3N1ZSBz
dGVtcyBmcm9tIHRoZSBvbWlzc2lvbiBvZiBlbWl0dGluZyBTVE9QIHVwb24gc3VjY2Vzc2Z1bAo+
IGV4ZWN1dGlvbiBvZiBzdmNfaTNjX21hc3Rlcl9kb19kYWFfbG9ja2VkKCkuIENvbnNlcXVlbnRs
eSwgdGhlIGNvbnRyb2xsZXIKPiBpbnRlcnByZXRzIGl0IGFzIGEgcmVwZWF0IHN0YXJ0IHdoZW4g
ZW1pdHRpbmcgdGhlIGF1dG8gSUJJIGNvbW1hbmQuIFBlciB0aGUKPiBJM0Mgc3BlY2lmaWNhdGlv
biwgYW4gSUJJIHNob3VsZCBuZXZlciBvY2N1ciBkdXJpbmcgYSByZXBlYXQgc3RhcnQsIHRodXMK
PiBwcmV2ZW50aW5nIHRoZSBJQklXT04gZmxhZyBmcm9tIGJlaW5nIHNldC4KPiAKPiBFbWl0IFNU
T1AgcmVnYXJkbGVzcyBvZiB0aGUgc3VjY2VzcyBvciBmYWlsdXJlIG9mCj4gc3ZjX2kzY19tYXN0
ZXJfZG9fZGFhX2xvY2tlZCgpIHRvIG1hdGNoIEkzQyBzcGVjIHJlcXVpcmVtZW50Lgo+IAo+IENj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBGaXhlczogMDViMjZjMzFhNDg1ICgiaTNjOiBt
YXN0ZXI6IHN2YzogYWRkIGhvdCBqb2luIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
