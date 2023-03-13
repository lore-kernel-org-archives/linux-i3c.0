Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32AC6FD19
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Mar 2023 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wj2XlEKI7FzEFVwdiJry1mLICwuKSAuhMMmhieJHuD4=; b=DOI+H+oSwU/4L3
	voturR9CVc/7/7IY23eBLQIsEvwCZ0XKHEqZm2/1X/x1t763th47h8wqHl9A7DZZ2JxiUavnhHvJi
	LUMQcM+nW/DioiXNPJ3I+ucMC+MGORozRyKtWks9BuCnSrkK8zO2zWLou5IrS8mnaK4KKpt3oK+B6
	QS8Z+J1hmBKF+U5VLg5DN0Lc+St01zZW4lTSZxQ7cru0O7an9Ah536n/Rd4SJXflHI2EBw9Vn+E2+
	kZnH760qbCJRzu1FO9YqHHzFIOf2eDz7VtavAe3Qt5402BAOtKYzKMEzUu9KY64331+IsNp9z/YVx
	iUTvLO9F7l5OkCLwEOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiUQ-005ySJ-3d; Mon, 13 Mar 2023 13:45:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiRN-005w2p-BP
	for linux-i3c@lists.infradead.org; Mon, 13 Mar 2023 13:42:19 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0DCDE0007;
	Mon, 13 Mar 2023 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678714932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQfjLHn0hc/LhzNeHhR21iVt0zMEaX3G+uok5izD1iw=;
	b=KqzhHPkRI8L/xdrJa59vCdamwXCECstAKvIHzNVZtBTZZ2kfiOKqjs7l8wMDrZ6CkRUCo/
	tEyXveeYVFbRI6JJ+QuRYNRDqu1cw+zFehju8mF8W+OvdOZkcY1rOaYDbMqBC37ps5Gz+8
	PnkXI/m7bdKQF7PrdEyAcjNs3nM+wkksQrxJNV3hgpgjPB3Zp+JgzJhAHt706m44mDnRLG
	jCJLimH5KqBUV84j/3TEMlDpazXYHAdEXMDDotxhKarGX3kCzxskyBiPNwAcaytt/8z4/R
	OVVQyULkL+pQFZAPzFn2CWtcCXxXjOdlekAvIVLt+ifz68yk1rT0uKrTP/sW4g==
Date: Mon, 13 Mar 2023 14:42:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] i3c: dw: drop of_match_ptr for ID table
Message-ID: <167871488920.397851.11346721699258114456.b4-ty@bootlin.com>
References: <20230312132535.352246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230312132535.352246-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_064217_567676_06384A65 
X-CRM114-Status: UNSURE (   7.52  )
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

Ck9uIFN1biwgMTIgTWFyIDIwMjMgMTQ6MjU6MzUgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6Cj4gVGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRo
ZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4gdXNlZCBhbmQgdGhlIG9mX21hdGNoX3B0ciBkb2Vz
IG5vdCBoYXZlIGFueSBzZW5zZSAodGhpcyBhbHNvIGFsbG93cyBBQ1BJCj4gbWF0Y2hpbmcgdmlh
IFBSUDAwMDEsIGV2ZW4gdGhvdWdoIGl0IG1pZ2h0IG5vdCBiZSByZWxldmFudCBoZXJlKS4gIFRo
aXMKPiBhbHNvIGZpeGVzICFDT05GSUdfT0YgZXJyb3I6Cj4gCj4gICBkcml2ZXJzL2kzYy9tYXN0
ZXIvZHctaTNjLW1hc3Rlci5jOjEyMDE6MzQ6IGVycm9yOiDigJhkd19pM2NfbWFzdGVyX29mX21h
dGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJs
ZT1dCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGkzYzogZHc6IGRyb3Agb2Zf
bWF0Y2hfcHRyIGZvciBJRCB0YWJsZQogICAgICBjb21taXQ6IDFkYWUzZjFkZjcwMDVlMjdhMDA0
MDg1NWNlOGIzYzIxYzI2MmUzYjIKCkJlc3QgcmVnYXJkcywKCi0tIApBbGV4YW5kcmUgQmVsbG9u
aSwgY28tb3duZXIgYW5kIENPTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
