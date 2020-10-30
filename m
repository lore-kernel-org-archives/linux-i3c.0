Return-Path: <SRS0=u14M=EJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D52C5DF9D
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9767120757
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Nov 2020 18:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQ5jfw6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9767120757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C3tuKxYGTV7UZYzxGeHrCszWXlFShC1SK0F7L/yUuVE=; b=oQ5jfw6GJmDN8bMHETMxWCsD/
	cfaVFD9yzyX0AYJTbV7cR0W/Pk95hQg359qgKQB8WpUM4VqmtzqajZj9FMQtmEfASpkAbVjDxOlHA
	hg7vte1WhysnwVU/NwNSG4DzVBigHakltucETBxOZIrHbXflHK/tiQZ8glJ+PJSk6ZOODmph4KPNf
	JTSEcw98qlNRaX4zdqR4QSHXdlODOOqkhjVFZdshT0JggIAAsBLkQgC6D5ZW4nK6E2kDGRr07VytU
	GUiJdvKFjyJag5SFZHbXldRnrBzoXHvFpbUSFFqGswPcQq4f3xPIT+UY5bPUCOs4kcIR1Vrj+piAt
	30Es+O0CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka0hy-0000Rb-1V; Tue, 03 Nov 2020 18:07:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYR38-0005Dm-LW; Fri, 30 Oct 2020 09:50:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF5F143D;
 Fri, 30 Oct 2020 02:50:19 -0700 (PDT)
Received: from [10.57.18.142] (unknown [10.57.18.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76493F719;
 Fri, 30 Oct 2020 02:49:51 -0700 (PDT)
Subject: Re: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <22fc421c-1998-04d5-a7fb-54467644bf13@arm.com>
Date: Fri, 30 Oct 2020 09:49:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_055022_816848_FD5BE635 
X-CRM114-Status: GOOD (  16.74  )
X-Mailman-Approved-At: Tue, 03 Nov 2020 13:06:49 -0500
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Peter Chen <peter.chen@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Christian Gromm <christian.gromm@microchip.com>,
 ceph-devel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org,
 Danil Kipnis <danil.kipnis@cloud.ionos.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Guenter Roeck <linux@roeck-us.net>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org,
 Alexander Antonov <alexander.antonov@linux.intel.com>,
 Dan Murphy <dmurphy@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Achatz <erazor_de@users.sourceforge.net>,
 Konstantin Khlebnikov <koct9i@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Wu Hao <hao.wu@intel.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Hanjun Guo <guohanjun@huawei.com>, Oleh Kravchenko <oleg@kaa.org.ua>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Saravana Kannan <saravanak@google.com>, Anton Vorontsov <anton@enomsg.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, coresight@lists.linaro.org,
 linux-media@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Oded Gabbay <oded.gabbay@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
 linux-gpio@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-f2fs-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonas Meurer <jonas@freesources.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Ilya Dryomov <idryomov@gmail.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Kees Cook <keescook@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Roman Sudarikov <roman.sudarikov@linux.intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i3c@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 Johan Hovold <johan@kernel.org>, Andreas Klinger <ak@it-klinger.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, linux-iio@vger.kernel.org,
 Asutosh Das <asutoshd@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 10/30/20 7:40 AM, Mauro Carvalho Chehab wrote:
> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
> 
> Address them, in order to provide a clean output.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO
> Reviewed-by: Tom Rix <trix@redhat.com> # for fpga-manager
> Reviewed-By: Kajol Jain<kjain@linux.ibm.com> # for sysfs-bus-event_source-devices-hv_gpci and sysfs-bus-event_source-devices-hv_24x7
> Acked-by: Oded Gabbay <oded.gabbay@gmail.com> # for Habanalabs
> Acked-by: Vaibhav Jain <vaibhav@linux.ibm.com> # for sysfs-bus-papr-pmem
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>



>   .../testing/sysfs-bus-coresight-devices-etb10 |   5 +-
For the above,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
