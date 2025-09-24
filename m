Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73153CAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfnuLzMxApbiJJo8z5ZA99ceYnA2KZjF8pWT/EDc7cA=; b=vZ04bJpPp/KKol
	ZyOTRD3cn18wFBsm6NRoEdpXd5HHN/3PS++2AKHxnIHW8hNfUnvHLVrCUC9BzLtqBv2ZyoM2Q8cdE
	bUmvJs+X6/HCyaNCF6d/f9FpCkpXIa4FXrE2arBN9YHIk03I/k4KYk0XTYzUjkN6cb3vRixEE2mI9
	+nJmNlf0rBg7hkctkXIur/g/lhW+BxqzfWWIJDjnvk26092j2FMBydASqMsAT6B7ZD2gG9cWCuUy5
	FEwUVEVsMKAJ6mC+vyFoMHq2eDbfDenQdwrI87C/2zlZdW/oGHpzXzWwrJandKM24SJ91/ugJbSqj
	RiTq5IKlQf8W4kgCGKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U6O-00000002YE9-0stx;
	Wed, 24 Sep 2025 18:20:28 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U6K-00000002YBG-3BzG
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 18:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltoZgH/86zKlX7nIlLNNxEf+tbNnKOD6SQvp+GvnEYof0mN6v+lWpOaqAWT1acIs3Mt6t48cLcC1XdU6eVX3WnJynzAehQfsqt37wjiJtCgX7JaZVeEoAKPTUUkbH+AjJt1a54LR1oOb3KdtkLLJOvvmOXzOZGVAFme80LTLN01e/lhQb9AzLqYDbkfu8ju2wg6e1Se6NthnHKlCuwHXtKLgbNWjwtfYvtp69ckWxuRGWfEAsRpkAmul4zYXHRdzoP+/F6wOoqhte/LnV+caLnYFBB/4TLE11wICAVRXNdbtQFsT3Iqs8j7E0jbdk41ZEF7ZOcehca8bh/MXHaZ6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5fO4H+cNzXTOwWQ6HS4IOiL0Tb8mE2XJ7jISJaUPnE=;
 b=R4hfn9R6dBOz4diYYZtyP1ghdod2oqsATglulol6Z8UQ1Ypki86ttHGmBk+XgMY/kduDudUxCgXBiN2GtYvw4K8kTd28SK0pclnAivGupdMT7oKjaGaAM6W+DPARATG5M4RPIANFb5WcoPUtGcA84UjB5AY+VG2zj905sGS6RBADyMDU0cF5z6CMhZHxv3gchJrrrCan2/8Q9GhvXZR3aEnoZZtfqiwwFB9NW+QA9H59VuoiDkiIJ9WjMRyzZGlDXDqcLtBq63GPT2RLqedzy3SDx74QHmSeNcaEzGVcj2zQScQ9T7tkyLRwx6JYZL4KA28lhKWGk7WYQT3s+dTWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5fO4H+cNzXTOwWQ6HS4IOiL0Tb8mE2XJ7jISJaUPnE=;
 b=MHmLT2Vd5qmGS/ec1wJp1vXHzsZ/yKj/Zq1M9nGYaBywrsOZDuy6tR0OTefUWSsoOEDxG+fDhf5DFrr+VF02FDWT8dU1Uw2jtBv4jqjCmUSNr55ha/J32aJw+ng8xXqrXqUP0z3+0JB1FGuJj0lk9KcebSn+iMKPhiqCzxOz4QdAqTfOh9s5YLxCHYmENSu6YY27O/6K+AFDwGB0KzeYJ4PVhVPZGVhRhdYguujNtXGDoisXOuwgcWdlsFfIJbRlFTgM4gRZf9h/ToHjwqn2dDHhSReUsBGd02X2BLnA7xpi1gNIy90sJn6tCc7NEOQmNhLNTIMOjjBnqx2OdtcNgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GV2PR04MB11448.eurprd04.prod.outlook.com (2603:10a6:150:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 18:20:12 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 18:20:12 +0000
Date: Wed, 24 Sep 2025 14:20:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Boris Staletic <bstaletic@axiado.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aNQ2U58hF5LzK9cT@lizhi-Precision-Tower-5810>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
 <aMwT9S92IpIOT_Gq@axiado.com>
 <aNE2aAxJzo2edoRm@axiado.com>
 <6b8271ea-282f-4900-a5ab-622c4eb85dbd@oss.qualcomm.com>
Content-Disposition: inline
In-Reply-To: <6b8271ea-282f-4900-a5ab-622c4eb85dbd@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GV2PR04MB11448:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c6c7c8-4b3b-4b16-2e82-08ddfb970023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LmfpJEuKAgk1HoJcakDR1TA7nQGSOlt1TEnIlLeOkzGjz+OZEBSYKehaJavN?=
 =?us-ascii?Q?AyjRe/fMc36Jh0yLzXz8UIXzIz9PgymjI4Y9aqK2QxcMH7sM/ZXzmwjlhTkb?=
 =?us-ascii?Q?X/vFySXGFZh+wN45aRGspr5Jl7HtNbBYc8xWB7f0/mF+40ypQ8JRjfITwn5X?=
 =?us-ascii?Q?qGxwyrexVMeAo4/Rv7KhE3+OKlMIO7vqLx+p92ozt33igqRU86TSAcKW4MIO?=
 =?us-ascii?Q?0TAX0uFlUv1QzFaJ9gUluzZYbV3p+25fxMVXnOFI0xVxqhgv0xYMNH5BU22g?=
 =?us-ascii?Q?3p8h5Ea4dYSfjORS/HyxYjIGkaK8YzMEgExjcrbEPYLXBpb6a03w/FmmlLTo?=
 =?us-ascii?Q?j0IfFlY6bZsbIS3a4H3pRy6ztIQkMPPkdrcMae9l4m2NEJRSYsf/e6P1J0H3?=
 =?us-ascii?Q?8w90A+MvDLIurnjrqfjZWiQEiX9QVdC7ktqqZbQO1DuSoX0tB+4M9xlk/u6y?=
 =?us-ascii?Q?jAu6B2hoUD7e49BWYdaMSivcBsdZlaburWZS2tCiPlg4Ig1Qtbqg4z+Aw6Lm?=
 =?us-ascii?Q?JAZN6ziylVmpdRdNqB9FwC0gAgOFDuyrRzi1yYHlUKNxZfwACy1AioRYLIcF?=
 =?us-ascii?Q?IpkLm8aOc5eMtsD0ldHkNCnJXI7/xwWXQkWgZ8UjPVlcXQBRe9/mh6x9Drly?=
 =?us-ascii?Q?CThbYi8qn1HVI+JzQT7cMRemjGOwq3AucfJfvgm/dwQDVe84bgWXy+qHttO/?=
 =?us-ascii?Q?4yuY8DzLZVtc4ZCXzecrkUo9V5n3RBlAW2kfr1CKuAHA7IimiuurFNJp5jG3?=
 =?us-ascii?Q?t/1YYl8tS6pzmDTFx8PmIgTrvoePqmVml985gK2dD9N0WzAa1hP/AwJNfUoX?=
 =?us-ascii?Q?wiJcjBjqWYfcn1an9M0E5WNlPPRAiYJr0wYJpZX9NgL7s5DoiuOmyOOAYkzo?=
 =?us-ascii?Q?MeG6+mN1D+X5NIa8ssDk+7pMFCalE9QhTP3ohF3DdvWG9rhPu++MWRP5Xceq?=
 =?us-ascii?Q?HIoIwbh46xNHgFKHA1jDi0UkCIiZUdnQVy8a46e2VrMU6Og3UUiVSc1cQCKU?=
 =?us-ascii?Q?erBGtJ3hmQmYOopJgG5SF6HP7PXlmWYeMNxo/G4lfDo3J3hHT67/liyiK0CS?=
 =?us-ascii?Q?Ljxx9q6zESXIzFDlOC8h9CF03ZvgottA1Y8M5ClaqISVe0HsWwTPPz/M+cT4?=
 =?us-ascii?Q?eSKpK5NFVMYjy1/NASnD5yJ0uu+Y3EYEFl/SAx6K3xywUJtySPayeCXawdJI?=
 =?us-ascii?Q?JWkW2HoS1PSexFBoycjZcLk4XuR7wYNYBD7RqqaIp1thN3mU4xk574WCWHBU?=
 =?us-ascii?Q?VWn9NeNTz8OPJ+clp9wkzuT2QmRTwTm2yHqikNNi0IFE+kE1XlyqcMzdceb3?=
 =?us-ascii?Q?DyRjPLRxukBWyQk9HL5KnBTdHHcNoPnAm6YCCcZ0tNhLhpY+nHhhKCYJj5pj?=
 =?us-ascii?Q?i5LCZcbkx/DA0AmOszjprUC4BeZGgUkPkxkF8Jalkrv0fwaytu3DLmxLREQJ?=
 =?us-ascii?Q?WEUrWCv8B1ReWIDY8Mhvy7ax1ECZkwXzKd/QWV2JkuYB03lPh5fkCG5leyRQ?=
 =?us-ascii?Q?qfO71F9Chbl/mM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aBFAChukOzUAXx/NWCTvDUEb4GOcKSrxRHi82RSrSZXOlrMYQcvRSv/mWRSk?=
 =?us-ascii?Q?qRHn0j+9iOw9tU1jD/YA+7BBbzz2CDYew5iGVj9AiUDOC14bTAzou63ThFO6?=
 =?us-ascii?Q?Ay4apYwsQc0onaIJVp/G++dhzBXNMAGDZVrFMJLS6gHO0BRZZeh4j8y8ba6c?=
 =?us-ascii?Q?FVh6YYfqs5J8F3bHMqEiGYnozEHGi1Gr/XaNUznkkz4VyeMaIpJMWQiNyIrU?=
 =?us-ascii?Q?K/8S4Bz/FaHlBrK9gyRPIHSo2zSxU5qUineFy9vFDwBhR3kXweFbFsUIiY6e?=
 =?us-ascii?Q?g7pFT5805bDLTnry28ELAu3J/uIPNWDQrsgcm9KSx4QRdyAKmWJQ1cdnmIUX?=
 =?us-ascii?Q?LO25uSuiqKcEHnvHf6+iRDrQW5PazimJZp8TBR7uU0/Fgfr1IKM0bv0Q6qcv?=
 =?us-ascii?Q?O0Tk7sh6FQoNvDV2ARbKXWNLCfzaJJ4a7nVxdUsJ9308RObU7c+JeIQLIb9s?=
 =?us-ascii?Q?FVXSTTdPPgfRmpgqATm4pOVioY2nNb8/WV1c7FrbCVvXGw2pdoYBBNAaXBAP?=
 =?us-ascii?Q?YozulKdfPDuuCADAOxh7Za9s7VxZZe2zqS2d6dzhSuBI+6F31iG4ydWjTG/2?=
 =?us-ascii?Q?RXZUi27X7hUHv36T6Tf9FtWUAatWj8qrwaixVsyZq8LADBqvTjGjs14/FAUC?=
 =?us-ascii?Q?QCJ4Yh0j9TfrgMG+oTC0pkrpvrscYgYjdmWAYpQ8IuoJEVtPp+5eHPLTqT+H?=
 =?us-ascii?Q?+D+Z/nfrHr5MDO4bCncKavGhaENFV7OJaeT8L7Iec8I+alkgbXn0wv+dA7/k?=
 =?us-ascii?Q?8gN8UGlC1HG8cLZ71wRrBjjdEVeq/iELP2cMjTu88CNFbh8S4Q65iJ39HGxs?=
 =?us-ascii?Q?58PqS/JjFReYXTPe2xQIAAHYswZba61ncah6xmsUGhakzOGmpMn93DfQ0vfV?=
 =?us-ascii?Q?Be+ZtM10ALulx/AB8RLqCcAAdkyZ9xuv2i3tpnwaWWe3/9e+yEL4sXfmKoi1?=
 =?us-ascii?Q?4SrLs6AKBuWbSIf5MV9CGf9dHRfMetHC74Q9NlGbWP+a5WzTkgk1jsRM0h94?=
 =?us-ascii?Q?C0cjqGT3coCNuBpHPbh6SqnyXSKY8tClkqbPYqv8V7YyqalCaA1Bg96s1423?=
 =?us-ascii?Q?0KG2h0x77tDAZs3Dkm5iwwbCg6s9B+fQHiKau9oag9mbiIDt8zZIik7n1SSO?=
 =?us-ascii?Q?GqqblHu9WtkNDUKJj8tKGPDEbX0ezU8yfVUfMZYyFI2ZLXt6RXFtU3U85hrH?=
 =?us-ascii?Q?wM5QHIPaJufWuK1iHKYHzPvhztmhchRWUzejFGCDVK9gy26FxmSyCC44LZsn?=
 =?us-ascii?Q?VlxOmgpjRusIhISGqeyPXvFw9oYrmSZwEFYNZiRiopmFLtd/6N4bd2y4VJtc?=
 =?us-ascii?Q?d5TT1wCkRXXn2sB/yDlQVnxDLSA9EsVsaiuK0Uag+96mGSMH7ynCJw0Jfu8E?=
 =?us-ascii?Q?EVAz9/vRoVSAkrtIZw08feLq2iweyu1HlCEJGcLhDqONreYBxu0R3F+eNhVj?=
 =?us-ascii?Q?4AJA08tTdoMgIQa/Q8QuNcaEjOdX9W05flLeqjGYFvG+eX5zlbD5PxNbqXvk?=
 =?us-ascii?Q?EuQhwUS+Wl5LY76ev7v8uf3KX01KSF2W/tbAOKWPElid+/uiJTWbVqYA7YfW?=
 =?us-ascii?Q?+/n+FBPY6tWr6Ridl+I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c6c7c8-4b3b-4b16-2e82-08ddfb970023
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 18:20:11.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zNYmIdO6wCi8pdFM9hD86gtTXOzFN9zOldYUhLkd+8Ja6O7pts885HxjKXdxsSky4oVu5KSPFjVWsarhTGfrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_112024_972062_BE9B666A 
X-CRM114-Status: GOOD (  46.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Sep 24, 2025 at 12:16:45AM +0530, Mukesh Savaliya wrote:
> Hi Boris, Frank,
>
> On 9/22/2025 5:13 PM, Boris Staletic wrote:
> > On Thu, Sep 18, 2025 at 04:15:17PM +0200, Boris Staletic wrote:
> > > On Tue, Sep 16, 2025 at 01:08:44PM -0400, Frank Li wrote:
> > > > On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
> > > > > Hello,
> > > > >
> > > > > We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
> > > > > of using i2c-utils to communicate with the I2C slave from userland.
> > > > >
> > > > > With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
> > > > > All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
> > > > > I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
> > > > >
>
> Checked both .master_xfer() function registered for pure i2c controller and
> for i3c controller.
>
> I2C controller provides full implementation of .master_xfer() function from
> vendor driver, whereas for i3c controller, framework  first validates if any
> i2c devices with the passed address is already registered or not ?
>
> To suggest at i3c_master_i2c_adapter_xfer() - what's wrong if
> i3c_master_find_i2c_dev_by_addr() returns NULL ? can we not continue instead
> of returning -ENOENT ? If slave is not present, than we get NACK else
> continue to perform  master->ops->i2c_xfers() ?
>
> This is just my thought, I may be wrong. Please point me if i am missing any
> fundamental from I3C specs.

master.c search i2c_dev_desc to pass to controller driver.

static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
                                   struct i2c_msg *i2c_xfers,
                                   int i2c_nxfers)

look like below is more reasonable.

static int dw_i3c_master_i2c_xfers(
	struct i3c_master_controller *master,
	struct i2c_msg *i2c_xfers,
	int i2c_nxfers)


I am not sure why not use addr information in i2c_xfers, like other i2c
adaptor driver.

So framework needn't scan known dev for specific addr.

It looks like not worth to update all drivers and frameworks only for
i2cdetect function, which generally used for debug only.

And actually, i3c transfer protocol is difference i2c although address phase
is the same. but data transfer phase is difference.

Frank

>
> > > > > Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
> > > > > with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
> > > > >
> > > > > - i3c_master_controllr's i2c_adapter needs to have its class member set.
> > > > > - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
> > > > >    - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
> > > > >
> > > > > That much was enough to get i2c_detect to work with an I3C master.
> > > > > To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
> > > > > In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
> > > > >
> > > > > Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
> > > >
> > > > Generally, it is the same as I2C. just send out address, and check if target
> > > > ACK/NACK this address.
> > >
> > > Are you referring here to i2c_new_scanned_device? If so, that also, in
> > > my testing, couldn't detect any devices without modificatioins.
> > > The failure to scan happens because:
> > >
> > > - i2c_new_scanned_device calls i2c_default_probe, which calls
> > >    i2c_smbus_xfer.
> > > - that eventually gets to i3c_master_i2c_adapter_xfer, which looks up
> > >    existing devices by calling i3c_master_find_i2c_dev_by_addr.
> > > - i3c_master_find_i2c_dev_by_addr returns NULL
> > > - i3c_master_i2c_adapter_xfer then returns -ENOENT, ven before trying to
> > >    communicate over the wire.
> > >
> > > I am probably missing something, because, as far as I can tell, neither
> > > i2c_detect, nor i2c_new_scanned_device can currently be used with an I3C
> > > master.
> > >
> > > Would you mind elaborating more on the suggested approach?
> > >
> >
> > Replying here to post the diff of what I have tried (and attempted to
> > explain the opening email). Hopefully it will make it clearer what
> > is our need and (more so) what my attempted solution does.
> >
> > -------------------------------------------------------------
> >
> > This change allows I3C master drivers to trigger I2C slave detection
> > by i2c slave drivers, leveraging the existing i2c_detect mechanism.
> > ---
> >   drivers/i2c/busses/Makefile     |  1 +
> >   drivers/i2c/busses/i2c-axiado.c | 53 +++++++++++++++++++++++++++++++++
> >   drivers/i2c/i2c-core-base.c     | 12 +++++++-
> >   drivers/i3c/master.c            |  1 +
> >   4 files changed, 66 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/i2c/busses/i2c-axiado.c
> >
> > diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> > index 04db855fdfd6..7b51df1433c4 100644
> > --- a/drivers/i2c/busses/Makefile
> > +++ b/drivers/i2c/busses/Makefile
> > @@ -42,6 +42,7 @@ obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
> >   i2c-at91-y			:= i2c-at91-core.o i2c-at91-master.o
> >   i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+= i2c-at91-slave.o
> >   obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
> > +obj-y				+= i2c-axiado.o
> >   obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
> >   obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
> >   obj-$(CONFIG_I2C_BCM_IPROC)	+= i2c-bcm-iproc.o
> > diff --git a/drivers/i2c/busses/i2c-axiado.c b/drivers/i2c/busses/i2c-axiado.c
> > new file mode 100644
> > index 000000000000..d5006e250a3d
> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-axiado.c
> > @@ -0,0 +1,53 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * I2C bus driver for the Cadence I2C controller.
> > + *
> > + * Copyright (C) 2009 - 2014 Xilinx, Inc.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/reset.h>
> > +
> > +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, I2C_CLIENT_END };
> > +
> > +static int ax_i2c_detect(struct i2c_client *client, struct i2c_board_info *info)
> > +{
> > +	int byte = i2c_smbus_read_byte_data(client, 0);
> > +	if(byte < 0)
> > +		return -ENODEV;
> > +	strscpy(info->type, "axiado-client", I2C_NAME_SIZE);
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ax_i2c_of_match[] = {
> > +	{ .compatible = "axiado,ax300",},
> > +	{ /* end of table */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ax_i2c_of_match);
> > +
> > +
> > +static struct i2c_driver ax_i2c_drv = {
> > +	.driver = {
> > +		.name  = "axiado",
> > +		.of_match_table = ax_i2c_of_match,
> > +	},
> > +	.detect = ax_i2c_detect,
> > +	.address_list = normal_i2c,
> > +	.class = I2C_CLASS_HWMON
> > +};
> > +
> > +module_i2c_driver(ax_i2c_drv);
> > +
> > +MODULE_AUTHOR("Boris Staletic axiado-2532@axiado.com");
> > +MODULE_DESCRIPTION("Axiado I2C bus driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index ecca8c006b02..231c43cf657d 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -2467,13 +2467,22 @@ static int i2c_detect_address(struct i2c_client *temp_client,
> >   		return 0;
> >
> >   	/* Make sure there is something at this address */
> > -	if (!i2c_default_probe(adapter, addr))
> > +	temp_client->dev.bus = &i2c_bus_type;
> > +	temp_client->dev.type = &i2c_client_type;
> > +	temp_client->dev.parent = &temp_client->adapter->dev;
> > +	dev_set_name(&temp_client->dev, "i2c-temp-client");
> > +	int err3 = device_register(&temp_client->dev);
> > +	int err2 = i2c_default_probe(adapter, addr);
> > +	if (!err2) {
> > +		device_unregister(&temp_client->dev);
> >   		return 0;
> > +	}
> >
> >   	/* Finally call the custom detection function */
> >   	memset(&info, 0, sizeof(struct i2c_board_info));
> >   	info.addr = addr;
> >   	err = driver->detect(temp_client, &info);
> > +	device_unregister(&temp_client->dev);
> >   	if (err) {
> >   		/* -ENODEV is returned if the detection fails. We catch it
> >   		   here as this isn't an error. */
> > @@ -2542,6 +2551,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
> >   		dev_dbg(&adapter->dev,
> >   			"found normal entry for adapter %d, addr 0x%02x\n",
> >   			i2c_adapter_id(adapter), address_list[i]);
> > +		memset(&temp_client->dev, 0, sizeof(temp_client->dev));
> >   		temp_client->addr = address_list[i];
> >   		err = i2c_detect_address(temp_client, driver);
> >   		if (unlikely(err))
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 2ef898a8fd80..5fabba14de20 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -2494,6 +2494,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> >   	/* FIXME: Should we allow i3c masters to override these values? */
> >   	adap->timeout = 1000;
> >   	adap->retries = 3;
> > +	adap->class = 1;
> >
> >   	id = of_alias_get_id(master->dev.of_node, "i2c");
> >   	if (id >= 0) {
> > > Thanks in advance,
> > > Boris Staletic
> > >
> > > >
> > > > Address 7E, REPEAT START, scan's address. ACK/NACK STOP.
> > > >
> > > > Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
> > > > way.
> > > >
> > > > send 7E to avoid IBI during you send out address.
> > > >
> > > > Fank
> > > >
> > > > > The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
> > > > > I'd welcome any sort of feedback.
> > > > >
> > > > > Thanks,
> > > > > Boris Staletic
> > > > > --
> > > > > linux-i3c mailing list
> > > > > linux-i3c@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> >
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
