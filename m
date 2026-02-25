Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB95EFD211
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Feb 2026 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYKfJv+8Kx4rI3a9L7PvNRrZaNtJdgYykA2BUox51TE=; b=muuMRi18vkTaJi
	bRyLbkIU4rYs7MoDwG5/Rn/sxDYVFrGg9ULdEApdO235l92y2BDjHOd3HPmCL+GMYSZ0Gu6OCdgj8
	o46iHjgY5UBzwarED+Hbf05VjinfImloA1vrikf1tUdKf1xgVqwXbBGz8TUAAU+PWA9QYZQu2Tgi9
	IQ9uklSxrSuHvZZ7ZMiukC2P9Is6z8yRINGWr3vc/hNqBLeeYyOeOL7ZbI4KXjAD0/T+LthGJBbYB
	WZjOa6QEUuhz1ulx/9QtVjySHcG3kKSkif64a8dU8T6k3RU2frrH8iQfMi/j8Z94ZkVMlhGdx+c92
	I4gYtXZ4bF66yg3BRjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB3s-00000003eWo-3PDu;
	Wed, 25 Feb 2026 09:20:04 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB3q-00000003eVz-0ids
	for linux-i3c@lists.infradead.org;
	Wed, 25 Feb 2026 09:20:03 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-896fd2c5337so54124136d6.2
        for <linux-i3c@lists.infradead.org>; Wed, 25 Feb 2026 01:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772011201; cv=none;
        d=google.com; s=arc-20240605;
        b=km5NeyQHd1myoiVR2cxn94ldMIn7tAXMMSQaVqAeXaWRblQsbMfRg8Yu0G3kvD5arz
         cumq2Zew4+JhJx7wmb75DTRui7/wGNqPbSDtOaptEbdRLhmvmYjT/u8LgaglhgObEb7P
         zMB8CO7HcZs+QgwWyMBzhHHLW8aQKwKZx5ta97JYTTauVpeqZBobzKj6ya8xRgB1HBMx
         Lcbki1CqRthb6SE6JyzFJBhTlJaXQ2SMZop5hNGtH5EQAUcAKeuthSKxOPUxdmtVeB9q
         +4iSk6e/D7RD6jLGqXAiaUV+7FhAiq0jsmKsFQf07jeWeIoRDWGFQD5qIsgVb6eLW5bq
         ea3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p7qrlvxys63299QisQTrrm5GlFPOvrA4vTo2sJ4L9nY=;
        fh=nVk8KD2LeF0x7YCmEQxophmMCDWzSS6l4S0ylE6nTaA=;
        b=RVw//YVh03ZrhJUXnPjp8WLPTyoUMLnSLnMZ81my6ElLH4z9eaaJEbtTrEMzkihYoU
         HYcvBsKp9tlu+sBbMqoOFz34/Yq6ilHiqLdHZ2TPOkFolN55nOdm7F7Q21rU+x9xnYLt
         b6D+ylswlIeH5lw5FyGk6T4qGg9n3HMz9FEuKp/wqDLEZVIbkendCeGyFtqI1A9VNgEA
         0dBe4kUyXdqj6ggwl2LvpL2WkrTXrKvIieQK+Tl6Zovtl7iLhC17W6UvT1AThlOj2D2B
         FF53O//zO/rO521xVOV4gNTUh0eXiCAEJNuXZ3ghxTmdq/7L6Rgkh72x490JbPQ6NGnS
         0AwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772011201; x=1772616001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7qrlvxys63299QisQTrrm5GlFPOvrA4vTo2sJ4L9nY=;
        b=YpoQ1gr7Rt0yTK+uvbFVk0AMEF+2IKFclgXbrJsKquyA1cQQ0i6GqggQQ6RM5LD9pQ
         XJmwknl2e2tC+MPRoaMcQUgmbKdTFk/AfA12uRnR9N0X91WHhaUVVaGX1DA2aNAmCgwM
         ADl6NjvbFvQ+xeI/9bd9zRj01CBtqMCEQQyMyKrCJT29aFAbcstbtvHCS/iq+7h9kPEW
         2CeBBhzNVnsC+rraTMioQX3Tfry4lOraVwIXOAh2IVy7EZdLKdQKD5kJ54ic3Y8uBo5G
         ivQZrHIqOB9vXCMDgmRCBSP6uAnZDS/UWhyjJbaleWRem1r9zbnR9m74CaatipXqovmp
         CPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011201; x=1772616001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p7qrlvxys63299QisQTrrm5GlFPOvrA4vTo2sJ4L9nY=;
        b=KClJAfekNuddNEOVDPPM51occltLI89NqIE09VgzOZOteRIMAtRrZKdjS5KYVl47RK
         qrg5mPSbIkaRdQ8ka8ZqZwIdCsih8WXAzkjF2wM779pix8hAclOAD9g7s29aZZ+KapQt
         JgI12mTsahu1jYDiPs2P8mdDCL81YUxib7lIHL14DwXHk7HbsZvKbdk4OYtLB1xQLibs
         xO4S+Y7LOJVcutMKdAs3V0hnbePENk50Qcium+nRgoNmgub/vUpzz6es/fxjRhPkqaSr
         KHy8ul7RGepoe4ZfG8SLHypPOPET5Ev+f3rddoOeAn4zFBagYbP/patuTTj8XZ7OH0Jf
         W0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJsV/Sa3vgC5zVAmFiWJ2UKb8JidszE4sly8jYkTUe3OyvcHiVg90w4x1SAFVX032aw0KqsQv/pEE=@lists.infradead.org
X-Gm-Message-State: AOJu0YymJUOOSCUP9g5gXHQ4bslE78aEhHcgfLq6P1Z2gX7iPr4JTRHt
	brr1kmammuNOepVzz6oquaEXfTRwuW9QF5UkCp7YuX550WAMiEhNBP1ynmbZ4SUHpXW1JK3nsJr
	kieDr1slI9IFHQElhEgCZVxehU62QxovSBrJY
X-Gm-Gg: ATEYQzyz+Yc3c9ya4EDKMKcIcfFRo9OnqUcHxD9hJKuup1dw0XHQoUJKsLgJjUv7TEz
	vFmokwvurU5z1tQH7uK8IitkzE0uLM7m2AD+KznToaAIY/+idaQR7VIj7jt6mXRXDl3tjKsgw9X
	/wf3tCfJ3e1JW9fMSOXJicMLjYjumvKuWErl59nBgyGfJiaBm8i11Y5LBkZGBL5VuPhV2kOJlcV
	eHQ4SXZ3QQHnAUYDpoCFTo93w4HW8BTMxh2c0wrIMO3jL+tI5vdjJurtlApo9ko1fKz8VoRNtKm
	BD2AcdV1
X-Received: by 2002:ac8:7c4e:0:b0:4f1:ea5b:860e with SMTP id
 d75a77b69052e-5070bcdd6d4mr216203331cf.65.1772011200649; Wed, 25 Feb 2026
 01:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20260225063529.3230676-1-peteryin.openbmc@gmail.com> <0307499b99c3ea9280ea2d6b9c3e325aeec46a0d.camel@codeconstruct.com.au>
In-Reply-To: <0307499b99c3ea9280ea2d6b9c3e325aeec46a0d.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Wed, 25 Feb 2026 17:19:49 +0800
X-Gm-Features: AaiRm50rP7ZdLca-s5zYyxO98CdUdUZhj_LClL3f4niQa_KD3-g87LSWbJAjVO4
Message-ID: <CAPSyxFRonXKcPaZ+wa_YvrwksWfPq+DnyxpEQygOUL0O4Kcixw@mail.gmail.com>
Subject: Re: [PATCH v1] i3c: master: ast2600: Fix missing of_node for virtual
 I2C adapter
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012002_219393_CA4B0107 
X-CRM114-Status: GOOD (  13.93  )
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

SmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1PiDmlrwgMjAyNuW5tDLmnIgyNeaX
pemAseS4iSDkuIvljYgyOjQz5a+r6YGT77yaCj4KPiBIaSBQZXRlciwKPgo+ID4gVGhlIEFTUEVF
RCBBU1QyNjAwIEkzQyBtYXN0ZXIgZHJpdmVyIGNyZWF0ZXMgYSB2aXJ0dWFsIEkyQyBhZGFwdGVy
IHRvCj4gPiBwcm92aWRlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBJMkMgZGV2aWNlcy4g
SG93ZXZlciwgdGhlIGN1cnJlbnQKPiA+IGltcGxlbWVudGF0aW9uIGRvZXMgbm90IGFzc29jaWF0
ZSB0aGlzIHZpcnR1YWwgYWRhcHRlciB3aXRoIGFueQo+ID4gRGV2aWNlIFRyZWUgbm9kZS4KPiA+
Cj4gPiBUaGlzIHBhdGNoIHByb3BhZ2F0ZXMgdGhlIG9mX25vZGUgZnJvbSB0aGUgSTNDIG1hc3Rl
ciBwbGF0Zm9ybSBkZXZpY2UKPiA+IHRvIHRoZSB2aXJ0dWFsIEkyQyBhZGFwdGVyJ3MgZGV2aWNl
IHN0cnVjdHVyZS4gVGhpcyBlbnN1cmVzIHRoYXQKPiA+IHN0YW5kYXJkIEkyQyBhbGlhc2VzIGFy
ZSBjb3JyZWN0bHkgcmVzb2x2ZWQgYW5kIGJ1cyBudW1iZXJpbmcgcmVtYWlucwo+ID4gY29uc2lz
dGVudCBhY3Jvc3MgcmVib290cy4KPgo+IFNvdW5kcyBzZW5zaWJsZSAtIGJ1dDoKPgo+ID4gLS0t
IGEvZHJpdmVycy9pM2MvbWFzdGVyL2FzdDI2MDAtaTNjLW1hc3Rlci5jCj4gPiArKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKPiA+IEBAIC0xNTYsNiArMTU2LDcg
QEAgc3RhdGljIGludCBhc3QyNjAwX2kzY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaTNjLT5zZGFfcHVsbHVwKTsKPiA+Cj4g
PiAgICAgICAgIGkzYy0+ZHcucGxhdGZvcm1fb3BzID0gJmFzdDI2MDBfaTNjX29wczsKPiA+ICsg
ICAgICAgaTNjLT5kdy5iYXNlLmkyYy5kZXYub2Zfbm9kZSA9IG5wOwo+ID4gICAgICAgICByZXR1
cm4gZHdfaTNjX2NvbW1vbl9wcm9iZSgmaTNjLT5kdywgcGRldik7Cj4gPiAgfQo+Cj4gV2h5IG5v
dCBkbyB0aGlzIGluIHRoZSBjb21tb24gKGR3KSBkcml2ZXI/IE5vdGhpbmcgYWJvdXQgdGhlIG9m
X25vZGUKPiBhc3NvY2lhdGlvbiBpcyBhc3BlZWQtc3BlY2lmaWMuCj4KPiBDaGVlcnMsCj4KPgo+
IEplcmVteQoKSGkgSmVyZW15LAogIEkgd2lsbCBtb3ZlIHRoZSBmaXggdG8gZHdfaTNjX2NvbW1v
bl9wcm9iZSBpbgpkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGFuZCBzZW5kIG91
dCBhIFYyIHBhdGNoIHNob3J0bHkuCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
